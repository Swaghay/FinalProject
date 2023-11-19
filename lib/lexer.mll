{
 open Parser
 exception SyntaxError of string
}

let newline = '\r' | '\n' | "\r\n"

rule token = parse
| "(*hint: axiom *)" { AXIOM }
| "(*hint: induction" { INDUCTION }
| "*" { STAR }
| "(*" { comment 0 lexbuf }
| newline { Lexing.new_line lexbuf; token lexbuf }
| [' ' '\t'] { token lexbuf }
| "|" { PIPE }
| "=" { EQUALS }
| "type" {TYPE}
| ":" { COLON }
| "(" { LPAREN }
| ")" { RPAREN }
| "->" { ARROW }
| ['a'-'z' 'A'-'Z' '0'-'9' '_' '\\']+ as id { 
    match id with
    | "let" -> LET
    | "(*prove*)" -> PROVE
    | "rec" -> { RECURSION } (*rec is a build-in function in Ocaml*)
    | "of" -> { OF }
    | "match" -> { MATCH }
    | "with" -> { WITH }
    | _ -> IDENT id }
| eof { EOF }
| _ { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }
and comment level = parse
| "*)" { if level = 0 then token lexbuf
                        else comment (level - 1) lexbuf }
| newline { Lexing.new_line lexbuf; comment level lexbuf }
| "(*" { comment (level + 1) lexbuf }
| eof { raise (SyntaxError "Unclosed comment") }
| _ { comment level lexbuf }
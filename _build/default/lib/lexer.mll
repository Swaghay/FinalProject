{
 open Parser
 exception SyntaxError of string
}

let newline = '\r' | '\n' | "\r\n"

rule token = parse
| "(*hint:" { hint lexbuf}
| "(*" { comment 0 lexbuf }
| newline { Lexing.new_line lexbuf;token lexbuf }
| "//" [^ '\n' '\r']* { token lexbuf }
| [' ' '\t'] { token lexbuf }
| "let" { LET }
| "(*prove*)" { PROVE }
| "=" { EQUALS }
| ":" { COLON }
| "(" { LPAREN }
| ")" { RPAREN }
| ['a'-'z' 'A'-'Z' '0'-'9' '_' '\\']+ as id { 
    match id with
    | "let" -> LET
    | "(*prove*)" -> PROVE
    | _ -> IDENT id }
| eof { EOF }
| _ { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }
and comment level = parse
| "*)" { if level = 0 then token lexbuf
                        else comment (level - 1) lexbuf }
| newline { Lexing.new_line lexbuf; token lexbuf }
| "(*" { comment (level + 1) lexbuf }
| eof { raise (SyntaxError "Unclosed comment") }
| _ { comment level lexbuf }
and hint = parse
| "*)" { HINT }
| newline { Lexing.new_line lexbuf; token lexbuf}
| _ { hint lexbuf }

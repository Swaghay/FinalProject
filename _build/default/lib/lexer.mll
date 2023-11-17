{
 open Parser
 exception SyntaxError of string
}

let newline = '\r' | '\n' | "\r\n"

rule token = parse
| "(*hint:" { HINT }
| "(*" { comment 0 lexbuf }
| "*" { STAR }
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
| _ { 
      let lexeme_str = Lexing.lexeme lexbuf in
      if String.length lexeme_str > 0 then (
        Printf.eprintf "Debug: Unexpected char: %s\n" lexeme_str;
        raise (SyntaxError ("Unexpected char: " ^ lexeme_str))
      ) else (
        Printf.eprintf "Debug: Unexpected newline character\n";
        raise (SyntaxError "Unexpected newline character")
      )
    }

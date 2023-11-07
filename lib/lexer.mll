{
 open Parser
 exception SyntaxError of string
}

let newline = '\r' | '\n' | "\r\n"

 rule token = parse
| [' ' '\t'] { token lexbuf }
| "(*prove*)" { PROVE }
| "(*hint:" { HINT }
| "(*" { comment 0 lexbuf }
| "*)" { commentclose 0 lexbuf}
| ['a'-'z' 'A'-'Z' '0'-'9' '?' '_' '\'']+ as id { IDENT id }
| eof { EOF }
| _ { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }

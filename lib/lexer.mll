{
 open Parser
 exception SyntaxError of string
}

let newline = '\r' | '\n' | "\r\n"

 rule token = parse
| "(*" { comment 0 lexbuf }
| newline { Lexing.new_line lexbuf;token lexbuf }
| "//" [^ '\n' '\r']* { token lexbuf }
| [' ' '\t'] { token lexbuf }
| ['a'-'z' 'A'-'Z' '0'-'9' '_' '\\']+ as id { IDENT id }
| "(" { LPAREN }
| ")" { RPAREN }
| _ { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }
and comment level = parse
| "*)" { if level = 0 then token lexbuf
                        else comment (level - 1) lexbuf }
| newline { Lexing.new_line lexbuf;token lexbuf }
| "(*" { comment (level + 1) lexbuf }
| eof { raise (SyntaxError "Unclosed comment") }
| _ { comment level lexbuf }

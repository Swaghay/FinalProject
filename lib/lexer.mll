{
 open Parser
 exception SyntaxError of string
}

let newline = '\r' | '\n' | "\r\n"

 rule token = parse
| newline { Lexing.new_line lexbuf;token lexbuf }
| "//" [^ '\n' '\r']* { token lexbuf }
| [' ' '\t'] { token lexbuf }
| ['a'-'z' 'A'-'Z' '0'-'9']+ as id { IDENT id }
| "(" { LPAREN }
| ")" { RPAREN }
| _ { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }

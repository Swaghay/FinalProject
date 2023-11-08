{
 open Parser
 exception SyntaxError of string
}

let newline = '\r' | '\n' | "\r\n"

 rule token = parse
| [' ' '\t'] { token lexbuf }
| ['a'-'z' 'A'-'Z' '0'-'9']+ as id { IDENT id }
| "(" { LPAREN }
| ")" { RPAREN }
| _ { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }

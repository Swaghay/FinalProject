open To_String

let parse (d : decl) : decl list =
  let lexbuf = Lexing.from_string d in
  let ast = Parser.main Lexer.token lexbuf in
     ast

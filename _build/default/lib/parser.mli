
(* The type of tokens. *)

type token = 
  | STAR
  | RPAREN
  | PROVE
  | LPAREN
  | LET
  | IDENT of (string)
  | HINT
  | EQUALS
  | EOF
  | COLON

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.decl list)

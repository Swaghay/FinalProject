
(* The type of tokens. *)

type token = 
  | WITH
  | TYPE
  | STAR
  | RPAREN
  | RECUR
  | PROVE
  | PIPE
  | OF
  | MATCH
  | LPAREN
  | LET
  | INDUCTION
  | IDENT of (string)
  | EQUALS
  | EOF
  | COMMA
  | COLON
  | AXIOM
  | ARROW

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.decl list)

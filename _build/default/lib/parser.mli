
(* The type of tokens. *)

type token = 
  | TYPE
  | STAR
  | RPAREN
  | REC
  | PROVE
  | PIPE
  | OF
  | LPAREN
  | LET
  | INDUCTION
  | IDENT of (string)
  | EQUALS
  | EOF
  | COLON
  | CLOSEHINT
  | AXIOM

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.decl list)

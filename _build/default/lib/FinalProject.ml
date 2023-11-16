open Ast
module Parser = Parser
module Lexer = Lexer

(* let parse (d : decl) : decl list =
  let lexbuf = Lexing.from_string d in
  let ast = Parser.main Lexer.token lexbuf in
     ast *)

let rec string_of_expression (p : expression) : string =
  match p with
  | Application (name, args)
-> "(" ^ name ^ " " ^
(String.concat " " (List.map string_of_expression args)) ^ ")"
  |Name name -> name

let rec string_of_typedNameList (l: typedName list) : string =
  match l with
  | [] -> ""
  | (Arguments (x, y))::t -> "(" ^ x ^ " : " ^ y ^ ") " ^ (string_of_typedNameList t)

let string_of_declaration (l) : string =
  match l with 
  | Let (name,args,exp1,exp2) -> "let " ^ name ^ " " ^ (string_of_typedNameList args) ^ "\n= (" ^ (string_of_expression exp1) ^  " = " ^ (string_of_expression exp2) ^ ")\n"
  | Prove (name,args,exp1,exp2) -> "let (*prove*) " ^ name ^ " " ^ (string_of_typedNameList args) ^ "\n= (" ^ (string_of_expression exp1) ^  " = " ^ (string_of_expression exp2) ^ ")\n"


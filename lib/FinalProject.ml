open Ast
module Parser = Parser
module Lexer = Lexer

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

let rec string_of_usefulCommentList (u: usefulComment list) : string =
  match u with 
  | [] -> ""
  | (S (str))::t -> str ^ " " ^ (string_of_usefulCommentList t)

let string_of_declaration (l) : string =
  match l with 
  | Let (name,args,exp1,exp2) -> "let " ^ name ^ " " ^ (string_of_typedNameList args) ^ "\n= (" ^ (string_of_expression exp1) ^  " = " ^ (string_of_expression exp2) ^ ")"
  | Prove (name,args,exp1,exp2) -> "let (*prove*) " ^ name ^ " " ^ (string_of_typedNameList args) ^ "\n= (" ^ (string_of_expression exp1) ^  " = " ^ (string_of_expression exp2) ^ ")"
  | Hint (lst) -> "(*hint: " ^ (string_of_usefulCommentList lst) ^ "*)"


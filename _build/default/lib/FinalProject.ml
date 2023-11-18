open Ast
module Parser = Parser
module Lexer = Lexer

(* let rec string_of_tuple_star (t: expression list) : string = 
  match t with 
  | [] -> ""
  | (Name h)::[] -> h 
  | (Name h)::tl -> h ^ "*" ^ string_of_tuple_star tl
  | _ -> assert false
(*Stack overflow answer told me how to ignore non exhaustive pattern matching error*)

let rec string_of_tuple_commas (t: a' list) : string =
  match t with
  | [] -> ""
  | (Name h)::[] -> h
  | (Name h)::tl -> h ^ ", " string_of_tuple_commas tl
  | (Arguments (s1, s2))::[] -> s1 ^ ": " ^ s2
  | (Arguments (s1, s2))::tl -> s1 ^ ": " ^ s2 ^ ", " ^ string_of_tuple_commas tl
  | _ -> assert false

let rec string_of_variantExpressionList (l: expression list) : string =
  match l with 
  | (Name h)::[] -> h
  | (Tuple t)::[] -> "(" ^ string_of_tuple_star t ^ ")"
  | (Name h)::tl -> h ^ " " ^ string_of_variantExpressionList tl
  | (Tuple t)::tl -> "(" ^ string_of_tuple_star t ^ ") " ^ string_of_variantExpressionList tl
  | _ -> assert false

let rec string_of_variantList (lst: variant list) : string =
  match lst with
  | (Type (s))::[] -> s 
  | (Type (s))::t -> s ^ " | "
  | (TypeOf (s, elst))::[] -> s ^ string_of_variantExpressionList elst
  | (TypeOf (s, elst))::t -> s ^ string_of_variantExpressionList elst ^ " | "
  | _ -> assert false
 *)
 
let rec string_of_expression (p : expression) : string =
  match p with
  | Application (name, args)
-> "(" ^ name ^ " " ^
(String.concat " " (List.map string_of_expression args)) ^ ")"
  | Name name -> name
  (* | Tuple l -> string_of_tuple_commas l *)

let string_of_equality (b: body) : string =
  match b with 
  | Equality (l,r) -> "(" ^ string_of_expression l ^ " = " ^ string_of_expression r ^ ")"

let rec string_of_typedNameList (l: typedName list) : string =
  match l with
  | [] -> ""
  | (Arguments (x, y))::t -> "(" ^ x ^ " : " ^ y ^ ") " ^ (string_of_typedNameList t)


let string_of_declaration (l) : string =
  match l with 
  | Let (name,args,b) -> "let " ^ name ^ " " ^ (string_of_typedNameList args) ^ "\n= " ^ (string_of_equality b)
  | ProveAxiom (name,args,b) -> "let (*prove*) " ^ name ^ " " ^ (string_of_typedNameList args) ^ "\n= " ^ (string_of_equality b) ^ "\n(*hint: axiom *)"
  | ProveInduction (name, args, b, i) -> "let (*prove*) " ^ name ^ " " ^ (string_of_typedNameList args) ^ "\n= " ^ (string_of_equality b) ^ "\n(*hint: induction " ^ i ^ " *)"
  (* | Variant (s, lst) -> s ^ string_of_variantList lst *)


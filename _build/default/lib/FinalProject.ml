open Ast
module Parser = Parser
module Lexer = Lexer

let rec string_of_expression (p : expression) : string =
  match p with
  | Application (name, args)
-> "(" ^ name ^ " " ^
(String.concat " " (List.map string_of_expression args)) ^ ")"
  | Name name -> name
  | MatchStatement (PatternMatch (name, args), expr) ->
  "| " ^  name ^ " " ^  string_of_typedNameList args ^ "->" ^ string_of_expression expr
and string_of_typedNameList (l: typedName list) : string =
    match l with
    | [] -> ""
    | (Arguments (x, y))::t -> "(" ^ x ^ " : " ^ y ^ ") " ^ (string_of_typedNameList t)

let rec string_of_pattern_typedListHelper (lst : typedName list) : string =
  match lst with
  | [] -> ""
  | Arguments (s,t)::[] -> s ^ " : " ^  t
  | Arguments (s,t)::tl -> s ^ " : " ^ t ^ ", " ^ string_of_pattern_typedListHelper tl

let string_of_pattern p : string =
  match p with
  | PatternMatch (s, []) -> s
  | PatternMatch (s, types) -> s ^ "(" ^ string_of_pattern_typedListHelper types ^ ")"

let rec string_of_expressionList (lst: expression list) : string =
  match lst with
  | [] -> ""
  | (MatchStatement (p, e))::t -> "| " ^ string_of_pattern p ^ " -> " ^ string_of_expression e ^ "\n" ^ string_of_expressionList t
  | _ -> assert false

let string_of_equality (b: body) : string =
  match b with 
  | Equality (l,r) -> "(" ^ string_of_expression l ^ " = " ^ string_of_expression r ^ ")"

let rec string_of_varTupList (l: varTup list) : string =
  match l with
  | [] -> ""
  | (TupSingle s)::[] -> s
  | (TupSingle s)::t -> s ^ "*" ^ string_of_varTupList t

let rec string_of_variantList (l: variant list) : string =
  match l with
  | [] -> ""
  | (Type s)::[] -> s
  | (TypeOf(s,lst))::[] -> s ^ " of (" ^ string_of_varTupList lst ^ ")"
  | (Type s)::t -> s ^ " | " ^ string_of_variantList t
  | (TypeOf(s,lst))::t -> s ^ " of (" ^ string_of_varTupList lst ^ ")" ^ string_of_variantList t

let string_of_declaration (l) : string =
  match l with 
  | Let (name,args,b) -> "let (*prove*) " ^ name ^ " " ^ (string_of_typedNameList args) ^ "\n= " ^ (string_of_equality b)
  | ProveAxiom (name,args,b) -> "let (*prove*) " ^ name ^ " " ^ (string_of_typedNameList args) ^ "\n= " ^ (string_of_equality b) ^ "\n(*hint: axiom *)"
  | ProveInduction (name, args, b, i) -> "let (*prove*) " ^ name ^ " " ^ (string_of_typedNameList args) ^ "\n= " ^ (string_of_equality b) ^ "\n(*hint: induction " ^ i ^ " *)"
  | Variant (s, lst) -> "type " ^ s ^ " = " ^ string_of_variantList lst 
  | LetMatch (s, args, return, matchvar, expressionlist) -> "let rec " ^ s ^ " " ^ (string_of_typedNameList args) ^ ": " ^ return ^ " = \n" ^ "match " ^ matchvar ^ " with \n" 
    ^ string_of_expressionList expressionlist


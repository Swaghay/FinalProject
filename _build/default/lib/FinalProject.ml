open Ast
module Parser = Parser
module Lexer = Lexer

let parse (s : string) : decl list =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.main Lexer.token lexbuf in
     ast

let rec string_of_typedNameList (l: typedName list) : string =
  match l with
  | [] -> ""
  | (Arguments (x, y))::t -> "(" ^ x ^ " : " ^ y ^ ") " ^ (string_of_typedNameList t)

let rec string_of_expression (p : expression) : string =
  match p with
  | Application (name, args)
-> "(" ^ name ^ " " ^
(String.concat " " (List.map string_of_expression args)) ^ ")"
  | Name name -> name
  | Tuple (e) -> "(" ^ string_of_tuple e ^ ")"
and string_of_tuple (lst: expression list) : string =
  match lst with
  | [] -> ""
  | h::[] -> string_of_expression h
  | h::t -> string_of_expression h ^ ", " ^ string_of_tuple t

let rec string_of_pattern_typedListHelper (lst : typedName list) : string =
  match lst with
  | [] -> ""
  | Arguments (s,t)::[] -> s ^ " : " ^  t
  | Arguments (s,t)::tl -> s ^ " : " ^ t ^ ", " ^ string_of_pattern_typedListHelper tl

let rec string_of_patternList (lst: pattern list) : string =
  match lst with
  | [] -> ""
  | (PatternNoArgs (s, e))::[] -> "| " ^ s ^ " -> " ^ string_of_expression e
  | (PatternMatch (s, lst, e))::[] -> "| " ^ s ^ " (" ^ string_of_pattern_typedListHelper lst ^ ") -> " ^ string_of_expression e
  | (PatternNoArgs (s, e))::t -> "| " ^ s ^ " -> " ^ string_of_expression e ^ "\n" ^ string_of_patternList t
  | (PatternMatch (s, lst, e))::t -> "| " ^ s ^ " (" ^ string_of_pattern_typedListHelper lst ^ ") -> " ^ string_of_expression e ^ "\n" ^ string_of_patternList t

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
  | Let (name,args,b) -> "let (*prove*) " ^ name ^ " " ^ (string_of_typedNameList args) ^ "= \n" ^ (string_of_equality b)
  | ProveAxiom (name,args,b) -> "let (*prove*) " ^ name ^ " " ^ (string_of_typedNameList args) ^ "= \n" ^ (string_of_equality b) ^ "\n(*hint: axiom *)"
  | ProveInduction (name, args, b, i) -> "let (*prove*) " ^ name ^ " " ^ (string_of_typedNameList args) ^ "= \n" ^ (string_of_equality b) ^ "\n(*hint: induction " ^ i ^ " *)"
  | Variant (s, lst) -> "type " ^ s ^ " = " ^ string_of_variantList lst
  | LetMatch (s, args, return, matchvar, patternList) -> "let rec " ^ s ^ " " ^ (string_of_typedNameList args) ^ ": " ^ return ^ " = \n" ^ "match " ^ matchvar ^ " with \n" 
    ^ string_of_patternList patternList


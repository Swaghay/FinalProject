let rec string_of_expression (p : expression) : string =
  match p with
  | Application (name, args)
-> "(" ^ name ^ " " ^
(String.concat " " (List.map string_of_expression args)) ^ ")"
  |Name name -> name

let string_of_typedNameList (l: typedName list) : string =
  match l with
  | [] -> ""
  | (x, y)::t -> "( " ^ x ^ " : " ^ " ) " ^ (string_of_typedNameList t)

let string_of_decl (Let (name,args,exp1,exp2)) : string =
"Let " ^ name ^ " " ^ (string_of_typedNameList args) ^ "\n= (" ^ (string_of_expression exp1) ^  " = " ^ (string_of_expression exp2) ^ ")\n"


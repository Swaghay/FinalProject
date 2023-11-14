let rec string_of_expression (p : expression) : string =
  match p with
  | Application (name, []) -> name
  | Application (name, expressions)
  -> name ^ " (" ^
  (String.concat ", "
  (List.map string_of_expression expressions)
  ) ^ ")"
  | Arguments (name, type_name) -> name ^ " : " ^ type_name
  
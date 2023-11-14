let rec string_of_pattern (p : pattern) : string =
  match p with
  | Application (name, []) -> name
  | Application (name, patterns)
  -> name ^ " (" ^
  (String.concat ", "
  (List.map string_of_pattern patterns)
  ) ^ ")"
  | Arguments (name, type_name) -> name ^ " : " ^ type_name
  
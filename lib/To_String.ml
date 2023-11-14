let rec string_of_expression (p : expression) : string =
  match p with
  | Application (Name name1, Name name2) -> "(" ^ name1 ^ " " ^ name2 ^ ")"
  | Application (Application app, Name name)
  | Application (Name name, Application app)


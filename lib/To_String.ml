let rec string_of_expression (p : expression) : string =
  match p with
  | Application (name, args)
-> string_of_expression (name) ^ " (" ^
(String.concat " "
(List.map string_of_expression args)
) ^ ")"
  |Name name -> name

  (* | Application (Application app, Name name)
  | Application (Name name, Application app) *)


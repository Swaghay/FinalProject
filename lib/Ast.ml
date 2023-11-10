type expression =   
  | Func of string 
  | Application of (expression * expression) 


type decl = 
  | Let of (Identifier * typedName list * expression * expression) 

type typedName =
  | Var of string
  | Type of string
  | Arguments of (Var * Type)


(*
let apple_property (h: int) (s: int) =
  apple (apple h s) s = apple (apple s h) s


(apple ((apple h) s)) s
Application (Application (Func "apple", Application (Application (Func "apple", Func "h"), Func "s")), Func "s")
*)

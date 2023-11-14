type expression =   
  | Func of string 
  | Application of (expression * expression) 

type typedName =
  | Arguments of (string * string)
  
type decl = 
  | Let of (string * typedName list * expression * expression) 




(*
let apple_property (h: int) (s: int) =
  apple (apple h s) s = apple (apple s h) s

(apple ((apple h) s)) s
Application (Application (Func "apple", Application (Application (Func "apple", Func "h"), Func "s")), Func "s")

(h: int) (s: int)
[Arguments ("h", "int"), Arguments ("s", "int")]


*)

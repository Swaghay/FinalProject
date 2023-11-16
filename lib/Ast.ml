type expression =   
  | Name of string 
  | Application of (string * expression list) 

type typedName =
  | Arguments of (string * string)

type usefulComment = 
  | C of string 

type decl = 
  | Prove of (string * typedName list * expression * expression) 
  | Let of (string * typedName list * expression * expression)
  | Hint of usefulComment list





(*
apple (apple h) s s
(Application ("apple"; [Application ("apple"; [Name "h"]), Name "s", Name "s"]))

(h: int) (s: int)
[Arguments ("h", "int"), Arguments ("s", "int")]
*)


(*
Bad:
((apple ((apple h) s)) s)
Application (Application (Name "apple", Application (Application (Name "apple", Name "h"), Name "s")), Name "s")
*)
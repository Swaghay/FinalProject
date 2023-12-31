type typedName =
  | Arguments of (string * string)

type expression =   
  | Name of string 
  | Application of (string * expression list)
  | Tuple of (expression list)

type pattern = 
  | PatternNoArgs of (string * expression)
  | PatternMatch of (string * typedName list * expression)
  
type body =
  | Equality of (expression * expression)

type varTup =
  | TupSingle of string

type variant =
  | Type of string 
  | TypeOf of string * varTup list

type decl = 
  | ProveAxiom of (string * typedName list * body) 
  | ProveInduction of (string * typedName list * body * string)
  | Let of (string * typedName list * body)
  | Variant of string * variant list
  | LetMatch of (string * typedName list * string * string * pattern list)


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
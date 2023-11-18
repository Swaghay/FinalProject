type expression =   
  | Name of string 
  | Application of (string * expression list) 

type body =
  | Equality of (expression * expression)

type typedName =
  | Arguments of (string * string)

type varTup =
  | TupSingle of string

type variant =
  | Type of string 
  | TypeOf of string * varTup list

(*
   type list = 
   | Nil 
   | Cons of (int*list)

   Variant ("list", [Type "Nil"; TypeOf (Name "Cons", [Tuple of (Name "int", Name "list")])])

   type e = 
   | S of string 
   | L of e list

   Variant("e", [TypeOf ("S", [Name "string"]); TypeOf ("L", [Name "e", Name "list"])])
*)

type decl = 
  | ProveAxiom of (string * typedName list * body) 
  | ProveInduction of (string * typedName list * body * string)
  | Let of (string * typedName list * body)
  | Variant of string * variant list


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
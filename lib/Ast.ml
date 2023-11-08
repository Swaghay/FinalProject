type expression =   
  | expression of string 
  | Application of (expression * string) 

type decl = 
  | Let of (Identifier * TypedName list * expression * expression) 

type TypedName =
  | 

let apple_property (h: int) (s: int) =
  apple apple h s = apple apple s h

Let(apple_property, [(h*int),(s*int)], Application(apple (Application Var h,Var s)), Application(apple (apple, s), h))


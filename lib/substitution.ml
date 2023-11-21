open Ast

module Substitution :
sig
  type expression t
  val empty : expression t
  val singleton : string -> expression -> expression t
  val merge : expression t -> expression t -> expression t option
  val find : string -> expression t -> expression t option 
end

module Substitution = struct 

  exception MergeError

  module Smap = Map.Make(String)

  type t = expression Smap.t

  let empty = Smap.empty

  let singleton = Smap.singleton

  let merge map1 map2 = 
    let helper key v1 v2 = 
    match v1, v2 with
    | None, None -> None
    | Some mm1, None -> Some mm1
    | None, Some mm2 -> Some mm2
    | Some mm1, Some mm2 -> if mm1 = mm2 then mm1 else raise MergeError
    in Smap.merge helper map1 map2

  let find = Smap.find

  let rec substitute (vars: string list) (substitution: t) (e: expression) = 
    match e with
    | Name s -> if (List.mem s vars) then (find s substitution) else Name s
    | Application (s, lst) -> 

end
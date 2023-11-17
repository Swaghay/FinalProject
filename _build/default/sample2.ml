
(* Here are some other proofs to try your system on: *)
let (*prove*) append_assoc (l1 : list) (l2 : list) (l3 : list)
    = (append (append l1 l2) l3 = append l1 (append l2 l3))
  (*hint: induction l1 *)

(* A lemma about reverse of append: *)
let (*prove*) rev_append (l1 : list) (l2 : list)
    = (reverse (append l1 l2) = append (reverse l2) (reverse l1))
  (*hint: induction l1 *)

  (* no hints! *)

(* Output should read something like this:
  Proof of cf_inv_property:
   cf (inv (cf (inv h)))
  = {lemma cf_inv_commute}
   inv (cf (cf (inv h)))
  = {lemma cf_idempotent}
   inv (cf (inv h))
  = {lemma cf_inv_commute}
   inv (inv (cf h))
  = {lemma inv_involution}
   cf h
*)
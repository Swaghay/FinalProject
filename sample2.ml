
(* Here are some other proofs to try your system on: *)
let (*prove*) append_assoc (l1 : list) (l2 : list) (l3 : list)
    = (append (append l1 l2) l3 = append l1 (append l2 l3))
  (*hint: induction l1 *)

(* A lemma about reverse of append: *)
let (*prove*) rev_append (l1 : list) (l2 : list)
    = (reverse (append l1 l2) = append (reverse l2) (reverse l1))
  (*hint: induction l1 *)

  (* no hints! *)


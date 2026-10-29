/-
  proofs3: Implication

  `p → q` means "if p then q". A proof of it is a function: it takes a
  proof of `p` and gives back a proof of `q`. So you prove an implication
  with `fun hp => ...`, and you use one by applying it: if `f : p → q` and
  `hp : p`, then `f hp : q`.
-/

-- I AM NOT DONE

theorem self_imp (p : Prop) : p → p := sorry

theorem modus_ponens (p q : Prop) (hp : p) (hpq : p → q) : q := sorry

theorem imp_trans (p q r : Prop) (hpq : p → q) (hqr : q → r) : p → r := sorry

theorem curry_and (p q r : Prop) (h : p ∧ q → r) : p → q → r := sorry

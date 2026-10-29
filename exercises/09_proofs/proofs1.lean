/-
  proofs1: Propositions and proofs

  Lean is also a proof assistant. A statement like `2 + 2 = 4` is a type
  (a *proposition*), and a proof of it is a value of that type. `theorem`
  works like `def`, but for proofs.

  Two simple ways to prove things:

    rfl         proves `a = a`. Lean computes both sides first, so `rfl`
                also proves `2 + 2 = 4`.
    by decide   asks Lean to compute whether a statement is true. It works
                for things like `3 < 5` where the answer can be calculated.
-/

-- I AM NOT DONE

theorem two_plus_two : 2 + 2 = 4 := sorry

theorem list_length : [1, 2, 3].length = 3 := sorry

theorem reverse_list : [1, 2, 3].reverse = [3, 2, 1] := sorry

theorem less : 10 < 100 := sorry

theorem not_equal : 3 ≠ 4 := sorry

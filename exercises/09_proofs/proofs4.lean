/-
  proofs4: For all and there exists

  `∀ n : Nat, P n` says that P holds for every n. As with implication, a
  proof is a function: `fun n => (a proof of P n)`.

  `∃ n : Nat, P n` says that P holds for some n. Prove it by giving the
  number and the evidence: `⟨n, (a proof of P n)⟩`.

  (In VS Code, type ∀ as \all and ∃ as \ex.)
-/

-- I AM NOT DONE

theorem add_zero_all : ∀ n : Nat, n + 0 = n := sorry

theorem exists_big : ∃ n : Nat, n > 100 := sorry

theorem exists_square : ∃ n : Nat, n * n = 49 := sorry

-- If something holds for every number, it holds for 5.
theorem for_five (P : Nat → Prop) (h : ∀ n, P n) : P 5 := sorry

/-
  tactics2: Taking hypotheses apart

  `cases h` breaks a hypothesis into its pieces. For `h : p ∨ q` you get
  two goals: one where `p` holds and one where `q` holds.

    cases h with
    | inl hp => ...
    | inr hq => ...

  `obtain ⟨hp, hq⟩ := h` is a quick way to split an `∧` or an `∃`.

  The `omega` tactic proves arithmetic facts like `n + 1 > 6` from
  hypotheses like `n > 5`. You'll see more of it later.
-/

-- I AM NOT DONE

theorem or_swap (p q : Prop) (h : p ∨ q) : q ∨ p := by
  cases h with
  | inl hp => sorry
  | inr hq => sorry

theorem and_apply (p q r : Prop) (h : p ∧ q) (hpr : p → r) : r ∧ q := by
  obtain ⟨hp, hq⟩ := h
  sorry

theorem exists_bigger (h : ∃ n : Nat, n > 5) : ∃ m : Nat, m > 6 := by
  obtain ⟨n, hn⟩ := h
  sorry

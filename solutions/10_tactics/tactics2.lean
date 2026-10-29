theorem or_swap (p q : Prop) (h : p ∨ q) : q ∨ p := by
  cases h with
  | inl hp => exact Or.inr hp
  | inr hq => exact Or.inl hq

theorem and_apply (p q r : Prop) (h : p ∧ q) (hpr : p → r) : r ∧ q := by
  obtain ⟨hp, hq⟩ := h
  exact ⟨hpr hp, hq⟩

theorem exists_bigger (h : ∃ n : Nat, n > 5) : ∃ m : Nat, m > 6 := by
  obtain ⟨n, hn⟩ := h
  exact ⟨n + 1, by omega⟩

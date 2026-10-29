theorem both : 1 + 1 = 2 ∧ 2 + 2 = 4 := ⟨rfl, rfl⟩

theorem one_side : 1 = 2 ∨ 2 = 2 := Or.inr rfl

theorem and_swap (p q : Prop) (h : p ∧ q) : q ∧ p := ⟨h.2, h.1⟩

theorem and_to_or (p q : Prop) (h : p ∧ q) : p ∨ q := Or.inl h.1

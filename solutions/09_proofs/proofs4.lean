theorem add_zero_all : ∀ n : Nat, n + 0 = n := fun _ => rfl

theorem exists_big : ∃ n : Nat, n > 100 := ⟨101, by decide⟩

theorem exists_square : ∃ n : Nat, n * n = 49 := ⟨7, rfl⟩

theorem for_five (P : Nat → Prop) (h : ∀ n, P n) : P 5 := h 5

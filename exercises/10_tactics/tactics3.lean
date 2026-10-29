/-
  tactics3: Rewriting

  `rw [h]` uses an equation `h : a = b` to replace `a` with `b` in the goal.
  `rw [← h]` goes the other way, replacing `b` with `a`. You can list
  several: `rw [h1, h2]`. After rewriting, `rw` tries `rfl` to close the goal.

  You can also rewrite with library lemmas, such as

    Nat.add_zero : n + 0 = n
    Nat.add_comm : n + m = m + n
-/

-- I AM NOT DONE

theorem rw1 (a b c : Nat) (h1 : a = b) (h2 : b = c) : a = c := by
  sorry

theorem rw2 (f : Nat → Nat) (a b : Nat) (h : a = b) (hf : f b = 10) : f a = 10 := by
  sorry

theorem rw3 (a b : Nat) : a + b + 0 = b + a := by
  sorry

theorem rw4 (a b c : Nat) (h : c = a) : a + b = b + c := by
  sorry

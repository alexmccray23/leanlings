def replicate {α : Type} : Nat → α → List α
  | 0, _ => []
  | n + 1, x => x :: replicate n x

#guard replicate 3 'a' = ['a', 'a', 'a']
#guard replicate 0 'a' = []

theorem length_replicate {α : Type} (n : Nat) (x : α) :
    (replicate n x).length = n := by
  induction n with
  | zero => rfl
  | succ n ih => simp [replicate, ih]

theorem replicate_add {α : Type} (m n : Nat) (x : α) :
    replicate (m + n) x = replicate m x ++ replicate n x := by
  induction m with
  | zero => simp [replicate]
  | succ m ih =>
    rw [Nat.add_right_comm]
    simp [replicate, ih]

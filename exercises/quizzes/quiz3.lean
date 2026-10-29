/-
  quiz3: Proving your code correct

  This quiz uses recursion, induction, and the tactics you've learned.
  Write the function, then prove two facts about it.
-/

-- I AM NOT DONE

-- A list containing `x` exactly `n` times: replicate 3 'a' = ['a', 'a', 'a'].
def replicate {α : Type} : Nat → α → List α := sorry

#guard replicate 3 'a' = ['a', 'a', 'a']
#guard replicate 0 'a' = []

theorem length_replicate {α : Type} (n : Nat) (x : α) :
    (replicate n x).length = n := by
  sorry

theorem replicate_add {α : Type} (m n : Nat) (x : α) :
    replicate (m + n) x = replicate m x ++ replicate n x := by
  sorry

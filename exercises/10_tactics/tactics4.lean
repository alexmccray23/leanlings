/-
  tactics4: Automation

  Some tactics search for a proof on their own:

    simp      simplifies the goal using a large set of known facts
    omega     proves facts about +, -, <, ≤, = over Nat and Int, plus
              multiplication by constants
    decide    computes whether the statement is true

  `unfold f` replaces `f` with its definition, and `simp [f]` simplifies
  using the definition of `f` too.
-/

-- I AM NOT DONE

theorem s1 (xs : List Nat) : (xs ++ []).length = xs.length := by
  sorry

theorem o1 (x y : Nat) (h1 : x < y) (h2 : y < 10) : x + 1 < 10 := by
  sorry

theorem o2 (a b : Int) (h1 : 2 * a + b = 10) (h2 : a - b = 2) : a = 4 := by
  sorry

def double (n : Nat) : Nat := n + n

theorem double_eq (n : Nat) : double n = 2 * n := by
  sorry

theorem d1 : "lean".length + [1, 2].length = 6 := by
  sorry

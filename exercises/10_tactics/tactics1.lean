/-
  tactics1: Tactic proofs

  Writing proofs as terms gets hard quickly. After `by`, you can build a
  proof one step at a time with *tactics*. In VS Code, put your cursor
  inside a proof and the infoview shows the current goal and what you know.

    intro h       move an assumption from the goal into the context as `h`
    exact e       finish the goal with the term `e`
    apply f       use `f : a → b` to turn the goal `b` into the goal `a`
    constructor   split a goal like `p ∧ q` into two goals, `p` and `q`

  A `·` bullet focuses on one goal at a time.
-/

-- I AM NOT DONE

theorem t1 (p q : Prop) (hp : p) (hq : q) : p ∧ q := by
  constructor
  · sorry
  · sorry

theorem t2 (p q r : Prop) (hpq : p → q) (hqr : q → r) : p → r := by
  intro hp
  sorry

theorem t3 (p q : Prop) : p → q → p := by
  sorry

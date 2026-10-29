/-
  proofs2: And, Or

  `p ∧ q` ("p and q") is proved by proving both sides: `⟨hp, hq⟩` or
  `And.intro hp hq`. If `h : p ∧ q`, then `h.1 : p` and `h.2 : q`.

  `p ∨ q` ("p or q") is proved by proving one side: `Or.inl hp` for the
  left or `Or.inr hq` for the right.

  `p` and `q` below stand for any propositions. A named argument such as
  `(h : p ∧ q)` is a hypothesis: a proof you're given and can use.

  (In VS Code, type ∧ as \and, ∨ as \or, and → as \to.)
-/

-- I AM NOT DONE

theorem both : 1 + 1 = 2 ∧ 2 + 2 = 4 := sorry

theorem one_side : 1 = 2 ∨ 2 = 2 := sorry

theorem and_swap (p q : Prop) (h : p ∧ q) : q ∧ p := sorry

theorem and_to_or (p q : Prop) (h : p ∧ q) : p ∨ q := sorry

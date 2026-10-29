/-
  functions4: Generic functions

  A function can work for any type. Type parameters in curly braces are
  implicit: Lean works them out from the other arguments, so you don't pass
  them yourself.

    def identity {α : Type} (x : α) : α := x

    identity 5        -- here α is Nat
    identity "five"   -- here α is String

  `α × β` is the type of pairs. Write a pair as `(a, b)` and take it apart
  with `p.1` and `p.2` (also called `p.fst` and `p.snd`).
-/

-- I AM NOT DONE

def first {α β : Type} (p : α × β) : α := sorry

def swap {α β : Type} (p : α × β) : β × α := sorry

#guard first (1, "one") = 1
#guard swap (1, "one") = ("one", 1)
#guard swap (swap (true, 'x')) = (true, 'x')

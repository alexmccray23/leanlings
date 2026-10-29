/-
  dependent2: Types that depend on values

  A type can mention a value. Below, `Vect α n` is a list of exactly `n`
  elements, so the length is part of the type and Lean checks it when
  compiling.

  `Vect.head` only accepts vectors of length `n + 1`. Calling it on an
  empty vector is a type error rather than a crash at runtime.
-/

-- I AM NOT DONE

inductive Vect (α : Type) : Nat → Type where
  | nil : Vect α 0
  | cons {n : Nat} (x : α) (xs : Vect α n) : Vect α (n + 1)

namespace Vect

def toList {α : Type} {n : Nat} : Vect α n → List α
  | nil => []
  | cons x xs => x :: xs.toList

def head {α : Type} {n : Nat} : Vect α (n + 1) → α
  | cons x _ => x

-- The result has the same length as the input, and the type says so.
def map {α β : Type} {n : Nat} (f : α → β) : Vect α n → Vect β n
  | nil => sorry
  | cons x xs => sorry

-- Both inputs have length `n`, so there's no case for mismatched lengths.
def zip {α β : Type} {n : Nat} : Vect α n → Vect β n → Vect (α × β) n
  | nil, nil => nil
  | cons x xs, cons y ys => sorry

-- Add an element at the end. The return type is wrong: fix it.
def snoc {α : Type} {n : Nat} : Vect α n → α → Vect α n
  | nil, y => cons y nil
  | cons x xs, y => cons x (snoc xs y)

end Vect

def v3 : Vect Nat 3 := .cons 1 (.cons 2 (.cons 3 .nil))

#guard v3.head = 1
#guard (v3.map (· * 10)).toList = [10, 20, 30]
#guard (v3.zip (v3.map toString)).toList = [(1, "1"), (2, "2"), (3, "3")]
#guard (v3.snoc 4).toList = [1, 2, 3, 4]

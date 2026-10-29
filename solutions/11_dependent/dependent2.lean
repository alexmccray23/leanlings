inductive Vect (α : Type) : Nat → Type where
  | nil : Vect α 0
  | cons {n : Nat} (x : α) (xs : Vect α n) : Vect α (n + 1)

namespace Vect

def toList {α : Type} {n : Nat} : Vect α n → List α
  | nil => []
  | cons x xs => x :: xs.toList

def head {α : Type} {n : Nat} : Vect α (n + 1) → α
  | cons x _ => x

def map {α β : Type} {n : Nat} (f : α → β) : Vect α n → Vect β n
  | nil => nil
  | cons x xs => cons (f x) (xs.map f)

def zip {α β : Type} {n : Nat} : Vect α n → Vect β n → Vect (α × β) n
  | nil, nil => nil
  | cons x xs, cons y ys => cons (x, y) (xs.zip ys)

def snoc {α : Type} {n : Nat} : Vect α n → α → Vect α (n + 1)
  | nil, y => cons y nil
  | cons x xs, y => cons x (snoc xs y)

end Vect

def v3 : Vect Nat 3 := .cons 1 (.cons 2 (.cons 3 .nil))

#guard v3.head = 1
#guard (v3.map (· * 10)).toList = [10, 20, 30]
#guard (v3.zip (v3.map toString)).toList = [(1, "1"), (2, "2"), (3, "3")]
#guard (v3.snoc 4).toList = [1, 2, 3, 4]

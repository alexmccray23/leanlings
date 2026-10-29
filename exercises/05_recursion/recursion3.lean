/-
  recursion3: Recursive types

  A constructor can take values of the type being defined, which lets
  values nest inside each other. The `Tree` below is a binary tree that
  stores values of any type `α`.

  Functions on a recursive type usually call themselves on the smaller
  pieces, like the list functions did.
-/

-- I AM NOT DONE

inductive Tree (α : Type) where
  | leaf
  | node (left : Tree α) (value : α) (right : Tree α)

-- The number of values stored in the tree.
def Tree.size {α : Type} : Tree α → Nat
  | .leaf => 0
  | .node l _ r => sorry

def Tree.sum : Tree Nat → Nat
  | .leaf => sorry
  | .node l v r => sorry

-- Swap left and right everywhere in the tree.
def Tree.mirror {α : Type} : Tree α → Tree α := sorry

-- Values in order: the left subtree, then the value, then the right subtree.
def Tree.toList {α : Type} : Tree α → List α
  | .leaf => []
  | .node l v r => l.toList ++ [v] ++ r.toList

--        2
--       / \
--      1   3
--           \
--            4
def sample : Tree Nat := .node (.node .leaf 1 .leaf) 2 (.node .leaf 3 (.node .leaf 4 .leaf))

#guard sample.toList = [1, 2, 3, 4]
#guard sample.size = 4
#guard sample.sum = 10
#guard sample.mirror.toList = [4, 3, 2, 1]

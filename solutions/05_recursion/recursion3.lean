inductive Tree (α : Type) where
  | leaf
  | node (left : Tree α) (value : α) (right : Tree α)

def Tree.size {α : Type} : Tree α → Nat
  | .leaf => 0
  | .node l _ r => l.size + 1 + r.size

def Tree.sum : Tree Nat → Nat
  | .leaf => 0
  | .node l v r => l.sum + v + r.sum

def Tree.mirror {α : Type} : Tree α → Tree α
  | .leaf => .leaf
  | .node l v r => .node r.mirror v l.mirror

def Tree.toList {α : Type} : Tree α → List α
  | .leaf => []
  | .node l v r => l.toList ++ [v] ++ r.toList

def sample : Tree Nat := .node (.node .leaf 1 .leaf) 2 (.node .leaf 3 (.node .leaf 4 .leaf))

#guard sample.toList = [1, 2, 3, 4]
#guard sample.size = 4
#guard sample.sum = 10
#guard sample.mirror.toList = [4, 3, 2, 1]

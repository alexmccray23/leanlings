import Leanlings.Exercise

namespace Leanlings

/-- Every exercise, in the order learners should do them. -/
def exercises : Array Exercise := #[
  -- Introduction
  { name := "intro1", dir := "00_intro"
    hint := "There's nothing to fix here. Delete the line that says `-- I AM NOT DONE` \
      and save the file." },
  { name := "intro2", dir := "00_intro"
    hint := "Lean says it doesn't know the name `greting`. Compare it with the name \
      used in the `def` line." },

  -- Basics
  { name := "basics1", dir := "01_basics"
    hint := "Replace each `sorry` with a value of the right type: a number for `answer` \
      and a string in double quotes for `language`." },
  { name := "basics2", dir := "01_basics"
    hint := "`\"30\"` is a String, not a Nat: drop the quotes. A Bool is `true` or `false`. \
      A Char uses single quotes: `'L'`." },
  { name := "basics3", dir := "01_basics"
    hint := "With Nat, `3 - 10` is 0 because there are no negative naturals. `17 / 5` \
      rounds down. `17 % 5` is the remainder. With Int, `3 - 10` really is negative: `-7`." },
  { name := "basics4", dir := "01_basics"
    hint := "For `fullName`, join three strings: `first ++ \" \" ++ last`. For `describe`, \
      try `s!\"{name} is {age} years old\"`. You can `#eval \"Lean\".length` to check \
      the last one." },
  { name := "basics5", dir := "01_basics"
    hint := "`n % 2 == 0` is a Bool that says whether `n` is even. For `classify`, you can \
      chain conditions: `if n == 0 then ... else if n < 10 then ... else ...`." },

  -- Functions
  { name := "functions1", dir := "02_functions"
    hint := "`add(a, b)` doesn't call `add` with two arguments in Lean. Write \
      `add a (add b c)`." },
  { name := "functions2", dir := "02_functions"
    hint := "`applyTwice f x` should be `f (f x)`. For the last test, which function \
      applied twice turns 25 into 100? Try doubling: `(fun n => n * 2)` or `(· * 2)`." },
  { name := "functions3", dir := "02_functions"
    hint := "`multiply 3` is already a function `Nat → Nat`, so `def triple : Nat → Nat := \
      multiply 3` works. For the map, pass `(multiply 10)`." },
  { name := "functions4", dir := "02_functions"
    hint := "`p.1` is the first part of the pair and `p.2` the second. For `swap`, build a \
      new pair with the parts reversed: `(p.2, p.1)`." },

  -- Structures
  { name := "structures1", dir := "03_structures"
    hint := "Add the line `pages : Nat` to the structure, indented like the other \
      fields. Then build a book with `⟨\"Title\", \"Author\", 50⟩`, putting the fields \
      in the order they're declared." },
  { name := "structures2", dir := "03_structures"
    hint := "`Point.add p q` can be `⟨p.x + q.x, p.y + q.y⟩`. For `shiftX`, write \
      `{ p with x := p.x + dx }`." },

  -- Inductive types
  { name := "inductive1", dir := "04_inductive"
    hint := "`next` needs one line per constructor: `| .green => .yellow` and \
      `| .yellow => .red`. For `canGo`, you can write the same kind of match, \
      replacing `:= sorry`, or use `fun l => l == .green`." },
  { name := "inductive2", dir := "04_inductive"
    hint := "Add `| triangle (base height : Nat)` to the `inductive`. Then replace the \
      `| _ => sorry` line with one case per remaining constructor, for example \
      `| .square s => s * s`." },

  -- Recursion
  { name := "recursion1", dir := "05_recursion"
    hint := "`factorial (n + 1)` is `(n + 1) * factorial n`, and `factorial 0` is 1. \
      `fib (n + 2)` is `fib n + fib (n + 1)`." },
  { name := "recursion2", dir := "05_recursion"
    hint := "Every function has an `[]` case and an `x :: xs` case that calls itself on \
      `xs`. For `myMap`, the cons case is `f x :: myMap f xs`. For `myFilter`, use \
      `if p x then x :: myFilter p xs else myFilter p xs`. Replace `:= sorry` with \
      the `| [] => ...` lines." },
  { name := "recursion3", dir := "05_recursion"
    hint := "`size` of a node is `l.size + 1 + r.size`. `sum` is similar but adds `v` \
      instead of 1. To mirror a node, mirror both subtrees and swap them: \
      `.node r.mirror v l.mirror`." },

  -- Collections
  { name := "collections1", dir := "06_collections"
    hint := "`safeDiv`: `if y == 0 then none else some (x / y)`. `firstEven`: \
      `xs.find? (· % 2 == 0)`. In `describe`, add `| none => \"nothing\"`." },
  { name := "collections2", dir := "06_collections"
    hint := "`xs.map (fun x => x * x)`, `xs.filter (· % 2 == 0)`, \
      `xs.foldl (· * ·) 1`. Then combine: \
      `(xs.filter (· % 2 == 0)).map (fun x => x * x) |>.sum`." },
  { name := "quiz1", dir := "quizzes"
    hint := "`cartTotal`: `(cart.map Item.total).sum`. `findItem`: \
      `cart.find? (·.name == name)`. For `formatCents`, `cents / 100` is the dollars \
      and `cents % 100` the cents. If the cents are below 10, add a leading \"0\"." },

  -- Type classes
  { name := "classes1", dir := "07_classes"
    hint := "`toString c := s!\"rgb({c.r}, {c.g}, {c.b})\"`" },
  { name := "classes2", dir := "07_classes"
    hint := "Copy the `Rect` instance and change it for `Square`: \
      `instance : HasArea Square where area s := s.side * s.side`. For `totalArea`, \
      map `HasArea.area` over the list and sum it." },
  { name := "classes3", dir := "07_classes"
    hint := "`add v w := ⟨v.x + w.x, v.y + w.y⟩`. `hMul k v := ⟨k * v.x, k * v.y⟩`. \
      For negation: `instance : Neg Vec2 where neg v := ⟨-v.x, -v.y⟩`." },

  -- Monads
  { name := "monads1", dir := "08_monads"
    hint := "Change `let total := 0` to `let mut total := 0`. For `countVowels`, \
      declare `let mut count := 0`, loop with `for c in s.toList do`, and add 1 \
      when `\"aeiou\".contains c`. End with `return count`." },
  { name := "monads2", dir := "08_monads"
    hint := "`bossAge name := do let boss ← bosses.lookup name; ages.lookup boss`. For \
      `grandBossAge`, look up the boss and then call `bossAge` on them." },
  { name := "monads3", dir := "08_monads"
    hint := "Write a `do` block: `let b ← deposit balance d`, then \
      `let b ← withdraw b w1`, then `withdraw b w2`." },
  { name := "monads4", dir := "08_monads"
    hint := "`let a := rollDie` names the action without running it. Use \
      `let a ← rollDie` to run it and get the number out." },
  { name := "quiz2", dir := "quizzes"
    hint := "In `step`, match on the instruction. `.push n => pure (n :: s)`. For `.add`, \
      in a `do` block: `let (a, s) ← pop s`, `let (b, s) ← pop s`, \
      `pure ((b + a) :: s)`. For `run`: `let s ← prog.foldlM step []`, then pop the \
      top and return it." },

  -- Propositions and proofs
  { name := "proofs1", dir := "09_proofs"
    hint := "The first three can be `rfl` because both sides compute to the same value. \
      `10 < 100` and `3 ≠ 4` are not equations, so use `by decide`." },
  { name := "proofs2", dir := "09_proofs"
    hint := "`⟨rfl, rfl⟩` proves both sides of an ∧. `Or.inr rfl` proves the right side \
      of an ∨. For `and_swap`, use `⟨h.2, h.1⟩`. For `and_to_or`, use `Or.inl h.1`." },
  { name := "proofs3", dir := "09_proofs"
    hint := "`fun h => h` proves `p → p`. `hpq hp` applies the implication. \
      `imp_trans` is `fun hp => hqr (hpq hp)`. `curry_and` is \
      `fun hp hq => h ⟨hp, hq⟩`." },
  { name := "proofs4", dir := "09_proofs"
    hint := "`fun n => rfl` proves the ∀, since `n + 0` reduces to `n` (write `fun _ => rfl` to avoid the unused-variable warning). For the ∃s, give \
      a witness: `⟨101, by decide⟩` and `⟨7, rfl⟩`. For the last, apply `h` to 5: `h 5`." },

  -- Tactics
  { name := "tactics1", dir := "10_tactics"
    hint := "In t1, each bullet is one goal: `exact hp`, then `exact hq`. In t2, after \
      `intro hp` the goal is `r`: `apply hqr`, `apply hpq`, `exact hp`. For t3, \
      `intro hp hq` and then `exact hp`." },
  { name := "tactics2", dir := "10_tactics"
    hint := "`or_swap`: `exact Or.inr hp` in the first case and `exact Or.inl hq` in the \
      second. `and_apply`: `exact ⟨hpr hp, hq⟩`. `exists_bigger`: `exact ⟨n + 1, by omega⟩`." },
  { name := "tactics3", dir := "10_tactics"
    hint := "`rw1`: `rw [h1, h2]`. `rw2`: `rw [h]` and then `exact hf`. `rw3`: \
      `rw [Nat.add_zero, Nat.add_comm]`. `rw4`: `rw [h, Nat.add_comm]`." },
  { name := "tactics4", dir := "10_tactics"
    hint := "`simp` handles `s1`. `omega` handles `o1` and `o2`. For `double_eq`, the \
      goal mentions `double`, which omega doesn't know about. Use `unfold double` first, \
      then `omega`. `decide` handles `d1`." },
  { name := "tactics5", dir := "10_tactics"
    hint := "After `simp only [double]` in the succ case, the goal is \
      `double n + 2 = 2 * (n + 1)`. `rw [ih]` turns `double n` into `2 * n`, and \
      `omega` finishes. `myLength_map` has the same shape as `myLength_append`: \
      `induction xs with`, then `simp [myLength]` in the nil case and \
      `simp [myLength, ih]` in the cons case." },

  -- Dependent types
  { name := "dependent1", dir := "11_dependent"
    hint := "`thirdOrZero`: `xs[2]?.getD 0`, or \
      `if h : 2 < xs.size then xs[2] else 0`. `firstPlusLast`: \
      `xs[0] + xs[xs.size - 1]`. Lean can prove both indices are valid from `h`." },
  { name := "dependent2", dir := "11_dependent"
    hint := "`map`: `| nil => nil` and `| cons x xs => cons (f x) (xs.map f)`. `zip`: \
      `cons (x, y) (xs.zip ys)`. `snoc` should return `Vect α (n + 1)`." },
  { name := "dependent3", dir := "11_dependent"
    hint := "`five := ⟨5, by decide⟩`. For `add`, the proof can be \
      `by have := a.property; omega`. For `toPos?`: \
      `if h : n > 0 then some ⟨n, h⟩ else none`." },
  { name := "quiz3", dir := "quizzes"
    hint := "Define `replicate` by matching on `n`: `| 0, _ => []` and \
      `| n + 1, x => x :: replicate n x`. Prove both theorems with `induction n` \
      (or `induction m`) and `simp [replicate, ih]`. For `replicate_add`, first turn \
      `m + 1 + n` into `(m + n) + 1` with `rw [Nat.add_right_comm]`." }
]

end Leanlings

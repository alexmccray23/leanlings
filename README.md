# leanlings

Small exercises for learning to read and write [Lean 4](https://lean-lang.org/), in the
style of [rustlings](https://github.com/rust-lang/rustlings). Each exercise is a short Lean
file that doesn't work yet. You fix it, and the runner checks your work every time you save.

The 42 exercises go from basic syntax to proofs:

| Section            | Topics                                                       |
| ------------------ | ------------------------------------------------------------ |
| `00_intro`         | how the runner works, reading error messages                 |
| `01_basics`        | `def`, basic types, `Nat` arithmetic, strings, `if`          |
| `02_functions`     | calling functions, lambdas, partial application, generics    |
| `03_structures`    | structures, dot notation, `{ s with ... }`                   |
| `04_inductive`     | enumerations, constructors with data, pattern matching       |
| `05_recursion`     | recursion on `Nat`, lists, and trees                         |
| `06_collections`   | `Option`, `map` / `filter` / `foldl`                         |
| `07_classes`       | type classes, instances, operator overloading                |
| `08_monads`        | `do` notation, `let mut` and `for`, `Option`, `Except`, `IO` |
| `09_proofs`        | propositions as types, `∧`, `∨`, `→`, `∀`, `∃`               |
| `10_tactics`       | `intro`/`exact`/`apply`, `cases`, `rw`, `simp`/`omega`, induction |
| `11_dependent`     | safe indexing, length-indexed vectors, subtypes              |
| `quizzes`          | three larger exercises that combine earlier sections         |

Only Lean's core library is used, so you don't need Mathlib.

## Getting started

You need [elan](https://github.com/leanprover/elan), the Lean version manager. The
`lean-toolchain` file pins the Lean version, and elan installs it automatically the first
time.

```sh
cd leanlings
lake exe leanlings        # builds the runner, then starts watch mode
```

Open the exercise it names in your editor. VS Code with the
[Lean 4 extension](https://marketplace.visualstudio.com/items?itemName=leanprover.lean4) is
the best choice, because its infoview shows the goal while you write proofs. Open the
`leanlings` folder itself, not a parent folder.

An exercise counts as finished when:

1. the file compiles without errors (this includes the `#guard` tests at the bottom),
2. no `sorry` is left in it, and
3. you've deleted the `-- I AM NOT DONE` line.

The marker line lets you keep experimenting with `#eval` after the file compiles. When
you delete it, watch mode moves on to the next exercise.

## Commands

```
lake exe leanlings                 watch mode (same as `watch`)
lake exe leanlings list            every exercise and whether it's done
lake exe leanlings hint [NAME]     hint for NAME, or for the current exercise
lake exe leanlings run NAME        check one exercise
lake exe leanlings verify          check everything in order, stopping at the first unfinished one
```

In watch mode, type `h` + Enter for a hint, `l` for the list, `r` to re-check, or `q` to
quit.

Progress is saved in `.leanlings-state`. Delete that file to start the count over. The
exercise files themselves are never changed by the runner, so if you want to be able to
reset an exercise, run `git init && git add -A && git commit -m start` before you begin.

Reference solutions are in `solutions/`. Try not to look until you've had a real go.

## Adding or changing exercises

1. Write the exercise in `exercises/<section>/<name>.lean`, including the
   `-- I AM NOT DONE` line, and a passing solution at `solutions/<section>/<name>.lean`.
2. Add an entry with a hint to `Leanlings/Info.lean`. Exercises run in the order they're
   listed there.
3. Run `lake exe leanlings dev-check`. It checks that every exercise is listed, starts out
   unfinished, and has a solution that passes.

The runner is in `Leanlings/` and `Main.lean`. It's written in Lean too: it shells out to
`lean` for each file and reads the result from the exit code and messages.

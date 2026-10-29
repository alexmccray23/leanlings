/-
  intro1: Welcome to leanlings!

  Each exercise is a small Lean file that doesn't work yet. Your job is to
  fix it. While `leanlings watch` is running, it re-checks the file every
  time you save.

  An exercise is finished when:
    1. the file compiles without errors,
    2. no `sorry` is left in it, and
    3. you've deleted the "I AM NOT DONE" comment line.

  This first file already compiles. Read it, change the `#eval` lines to
  see how the output changes, then delete the comment line below to move on.
-/

-- I AM NOT DONE

-- `#eval` evaluates an expression and prints the result.
#eval 1 + 1
#eval "Hello, " ++ "Lean!"

-- `#check` shows the type of an expression without evaluating it.
#check 1 + 1
#check "Hello, Lean!"

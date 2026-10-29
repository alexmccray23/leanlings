/-
  quiz2: A stack calculator

  This quiz uses inductive types, pattern matching, `Except`, and `do`.

  A program is a list of instructions that run on a stack of integers:

    push n   put n on top of the stack
    add      pop two numbers and push their sum
    mul      pop two numbers and push their product
    neg      pop one number and push its negation

  Popping from an empty stack is an error.
-/

-- I AM NOT DONE

inductive Instr where
  | push (n : Int)
  | add
  | mul
  | neg

abbrev Stack := List Int

def pop (s : Stack) : Except String (Int × Stack) :=
  match s with
  | [] => throw "stack underflow"
  | x :: rest => pure (x, rest)

-- Run one instruction.
def step (s : Stack) (i : Instr) : Except String Stack := sorry

-- Run a whole program starting from an empty stack, and return the number
-- on top at the end. `List.foldlM` or a `for` loop will help.
def run (prog : List Instr) : Except String Int := sorry

def render : Except String Int → String
  | .ok n => s!"ok {n}"
  | .error e => s!"error: {e}"

open Instr in
#guard render (run [push 2, push 3, add, push 4, mul]) = "ok 20"
open Instr in
#guard render (run [push 5, neg, push 1, add]) = "ok -4"
open Instr in
#guard render (run [push 1, add]) = "error: stack underflow"
#guard render (run []) = "error: stack underflow"

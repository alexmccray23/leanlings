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

def step (s : Stack) (i : Instr) : Except String Stack :=
  match i with
  | .push n => pure (n :: s)
  | .add => do
    let (a, s) ← pop s
    let (b, s) ← pop s
    pure ((b + a) :: s)
  | .mul => do
    let (a, s) ← pop s
    let (b, s) ← pop s
    pure ((b * a) :: s)
  | .neg => do
    let (a, s) ← pop s
    pure (-a :: s)

def run (prog : List Instr) : Except String Int := do
  let s ← prog.foldlM step []
  let (top, _) ← pop s
  return top

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

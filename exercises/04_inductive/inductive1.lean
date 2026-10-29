/-
  inductive1: Enumerations

  `inductive` defines a type by listing its constructors, the different
  forms a value can take:

    inductive Coin where
      | heads
      | tails

  A function on such a type uses pattern matching to handle each case:

    def Coin.flip : Coin → Coin
      | .heads => .tails
      | .tails => .heads

  The leading dot in `.heads` means "find `heads` in the type that's
  expected here", so you don't have to write `Coin.heads`.
-/

-- I AM NOT DONE

inductive TrafficLight where
  | red
  | yellow
  | green
deriving Repr, DecidableEq

-- red → green → yellow → red
def TrafficLight.next : TrafficLight → TrafficLight
  | .red => .green
  -- Add the other cases.

-- Only green means go.
def TrafficLight.canGo : TrafficLight → Bool := sorry

#guard TrafficLight.red.next = .green
#guard TrafficLight.green.next = .yellow
#guard TrafficLight.yellow.next = .red
#guard TrafficLight.green.canGo
#guard !TrafficLight.red.canGo
#guard !TrafficLight.yellow.canGo

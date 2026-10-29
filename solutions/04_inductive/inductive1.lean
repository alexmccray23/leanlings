inductive TrafficLight where
  | red
  | yellow
  | green
deriving Repr, DecidableEq

def TrafficLight.next : TrafficLight → TrafficLight
  | .red => .green
  | .green => .yellow
  | .yellow => .red

def TrafficLight.canGo : TrafficLight → Bool
  | .green => true
  | _ => false

#guard TrafficLight.red.next = .green
#guard TrafficLight.green.next = .yellow
#guard TrafficLight.yellow.next = .red
#guard TrafficLight.green.canGo
#guard !TrafficLight.red.canGo
#guard !TrafficLight.yellow.canGo

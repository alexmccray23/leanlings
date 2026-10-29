def first {α β : Type} (p : α × β) : α := p.1

def swap {α β : Type} (p : α × β) : β × α := (p.2, p.1)

#guard first (1, "one") = 1
#guard swap (1, "one") = ("one", 1)
#guard swap (swap (true, 'x')) = (true, 'x')

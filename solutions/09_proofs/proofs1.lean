theorem two_plus_two : 2 + 2 = 4 := rfl

theorem list_length : [1, 2, 3].length = 3 := rfl

theorem reverse_list : [1, 2, 3].reverse = [3, 2, 1] := rfl

theorem less : 10 < 100 := by decide

theorem not_equal : 3 ≠ 4 := by decide

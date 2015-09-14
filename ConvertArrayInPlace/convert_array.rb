# Given an array [a1, a2, ..., aN, b1, b2, ..., bN, c1, c2, ..., cN]
# Convert it to [a1, b1, c1, a2, b2, c2, ..., aN, bN, cN]

# Returns the index of where the element should actually be placed.
# i = current_index
# n = number of elements each series (a1..aN).length
def get_new_idx(i, n)
  # I use the number 4 here but it correlates to the number of series.
  # For example, I only have "a", "b", "c", and "d" series so I use 4.
  (i % 4) * n + (i / 4)
end

def convert(array)
  n = array.length / 4

  array.each_index do |current_idx|
    true_idx = get_new_idx(current_idx, n)
    true_idx = get_new_idx(true_idx, n) while true_idx < current_idx

    array[current_idx], array[true_idx] = array[true_idx], array[current_idx]
  end

  array
end

p convert(["a1", "a2", "a3", "a4",
           "b1", "b2", "b3", "b4",
           "c1", "c2", "c3", "c4",
           "d1", "d2", "d3", "d4"])

# Given an array, return the sorted version of the array.

# Time complexity O(nlog(n))
# Space complexity O(1)

# This sort is not as good as merge and quick sort,
# but the good thing about this is how little space it takes.

# We can convert the array into a binary heap and use the binary heap's
# parent and children logic to sort the array.
# https://en.wikipedia.org/wiki/Binary_heap

# I freely use the term node here but it actually refers to a specific index
# in the array. I imagine the array to be a binary heap and refer to it like so.

# For binary min heap only.
def heap_sort!(array)
  return array if array.length < 2

  heapify!(array)
  unheapify!(array)

  # Take this reverse out if you want to sort in the opposite order.
  # Or you can swap the conditional signs and leave the reverse in.
  array.reverse!
end

private

# Returns the node/parent above it.
def parent(n)
  (n - 1)/2
end

# Returns the 2 children of the node.
def children(n, length)
  [(2 * n) + 1, (2 * n) + 2].select { |child| child < length }
end

# This method sorts the currently unordered array into a min heap.
# Read wikipedia for the min heap rules.

def heapify!(array)
  array.each_index do |current|

    # Swaps the current node with its parent if it's smaller than its parent
    while heapify_up?(array, current)
      swap!(array, current, parent(current))

      # Continues to swap up until it can't or at the root node
      current = parent(current)
    end
  end
end

# Turns the heap back into an array while maintaining min heap rule
# and accounting for shortening of heap.
def unheapify!(array)
  array.each_index do |current|
    heap_length = array.length - 1 - current

    # Starts building the array at the end of the heap
    swap!(array, 0, heap_length)

    # Accounts for shortening of heap due to array construction at the end
    current -= (array.length - heap_length - 1)

    # Swaps the current node with its best(smallest) child if it's
    # bigger than its children
    while heapify_down?(array, current, heap_length)
      best_child = children(current, heap_length).min_by do |child_idx|
        array[child_idx]
      end

      swap!(array, current, best_child)

      # Reset current to child to keep swapping down if needed.
      current = best_child
    end
  end
end

# Checks to see if node requires to be moved down the binary heap
def heapify_down?(array, i, length)
  children = children(i, length)
  children.any? { |idx| array[idx] < array[i] }
end

# Checks to see if node requires to be moved up the binary heap
def heapify_up?(array, i)
  array[parent(i)] > array[i] && i > 0
end

def swap!(array, m, n)
  array[m], array[n] = array[n], array[m]
end

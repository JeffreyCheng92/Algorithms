# Given an array, return the sorted version of the array.

# Time complexity O(nlog(n))
# Space complexity O(1)

# This sort is not as good as merge and quick sort,
# but the good thing about this is how little space it takes.

require 'byebug'

def heap_sort!(array)
  return array if array.length < 2

  heapify!(array)
  unheapify!(array)

  array.reverse!
end

private

def parent(n)
  (n - 1)/2
end

def children(n, length)
  [(2 * n) + 1, (2 * n) + 2].select { |child| child < length }
end

def heapify!(array)
  array.each_index do |current|
    while heapify_up?(array, current)
      swap!(array, current, parent(current))
      current = parent(current)
    end
  end
end

def unheapify!(array)
  array.each_index do |current|
    heap_length = array.length - 1 - current
    swap!(array, 0, heap_length)
    current -= (array.length - heap_length - 1)
    while heapify_down?(array, current, heap_length)
      best_child = children(current, heap_length).min_by do |child_idx|
        array[child_idx]
      end

      swap!(array, current, best_child)
      current = best_child
    end
  end
end

def heapify_down?(array, i, length)
  children = children(i, length)
  children.any? { |idx| array[idx] < array[i] }
end

def heapify_up?(array, i)
  array[parent(i)] > array[i] && i > 0
end

def swap!(array, m, n)
  array[m], array[n] = array[n], array[m]
end

$test = (0..100).to_a.shuffle
p $test
puts "\n\n\n"
p heap_sort!($test)

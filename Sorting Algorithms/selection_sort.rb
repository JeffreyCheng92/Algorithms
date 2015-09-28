# Given an array of integers, return the sorted array.

# Time complexity O(n^2)
# Space complexity O(1)
# Pretty useful for small arrays due to adaptivity.
# Reaches O(n) for nearly sorted arrays.

def selection_sort(array)
  array.length.times do |idx|
    min, min_idx = array[idx], idx
    array[idx..-1].each_with_index do |el, i|
      # Finds the min of the remaining array and sets it as the first element
      min, min_idx = el, i + idx if el < min
    end
    array[idx], array[min_idx] = array[min_idx], array[idx]
  end

  return array
end

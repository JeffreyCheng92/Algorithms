# Given an array of integers, return the sorted array.

# Time complexity O(n^2)
# Space complexity O(1)
# Pretty useful for small arrays due to adaptivity.
# Reaches O(n) for nearly sorted arrays.
require 'byebug'

def insertion_sort(array)
  array.each_with_index do |el, idx|
    # Skips the first index because there's nothing to compare
    next if idx.zero?

    # Compares current element with preceding element
    if el < array[idx - 1]

      # Iteratively checks the array elements preceding it
      (idx - 1).downto(0) do |check_idx|

        # If check_idx == 0, then we have compared it with all other elements
        # and el is smaller than all of them and not larger than any of them
        if check_idx == 0
          array.insert(0, array.delete(el))
          
        # If el is smaller than an element but larger than the preceding
        # element of that element, we need to insert it there.
        elsif el < array[check_idx] && el > array[check_idx - 1]
          array.insert(check_idx, array.delete(el))

          # Breaks after swapping to stop checking the rest of the elements
          break
        end
      end
    end
  end

  return array
end

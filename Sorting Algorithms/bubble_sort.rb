# Given an array of integers, return the sorted array.

# Time complexity O(n^2)
# Space complexity O(1)
# Pretty useful for small arrays.

def bubble_sort(array)
  sorted = false

  until sorted
    sorted = true

    array[0..-2].each_with_index do |num1, i|
      num2 = array[i + 1]
      if num2 < num1
        # If the next number is smaller than the current, swap the positions
        # and redo the sort from the beginning.
        sorted = false
        array[i], num2 = num2, array[i]
      end
    end

  end
  array
end

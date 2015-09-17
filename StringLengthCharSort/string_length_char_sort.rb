# Given an array of strings, sort the array by length and then alphabetical
# order.

def letter_length_sort(array)
  letter_merge_sort(array).sort_by { |word| word.length }
end

# Sorts the strings by their characters using merge sort
# Time complexity O(nlog(n) * string.length)
def letter_merge_sort(array)
  return array if array.length <= 1

  pivot = array.length / 2
  left = array[0...pivot]
  right = array[pivot..-1]

  return letter_merge(letter_merge_sort(left), letter_merge_sort(right))
end

def letter_merge(arr1, arr2)
  result = []

  until arr1.length.zero? || arr2.length.zero?
    if letter_swap?(arr1.first, arr2.first)
      result << arr2.shift
    else
      result << arr1.shift
    end
  end

  return result.concat(arr1).concat(arr2)
end

# Time complexity O(str.length)
# I guess you could say its constant but it depends on the number of characters
def letter_swap?(str1, str2)
  idx = 0
  until idx >= str1.length || idx >= str2.length
    if str1[idx] == str2[idx]
      idx += 1
      next
    elsif str1[idx] > str2[idx]
      return true
    else
      return false
   end
   idx += 1
 end
end

p letter_length_sort(["dog", "dad", "zebra", "parent", "door", "ant", "and"])

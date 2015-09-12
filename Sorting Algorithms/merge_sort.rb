# Given an array, return the sorted version of the array.

# Time complexity O(nlog(n))

# Space complexity is complicated because ruby does not have tail-recursive
# calls so garbage collection is not performed when traversing each stack.
# If someone knows the answer, let me know the explanation.

def merge_sort(array)
  # Base case
  return array if array.length <= 1

  mid_idx = array.length / 2

  # Breaks the array into left and right halves to divide and conquer
  left_arr = array[0...mid_idx]
  right_arr = array[mid_idx..-1]

  return merge(merge_sort(left_arr), merge_sort(right_arr))
end

# The sorting mechanism of merge sort
def merge(arr1, arr2)
  result = []

  until arr1.length == 0 || arr2.length == 0
    # if arr1.first > arr2.first
    #   result << arr2.shift
    # else
    #   result << arr1.shift
    # end

    # Nice one liner for the commented conditional statement above
    # Would not recommend for readability but it's cool :)
    result << (arr1.first > arr2.first ? arr2.shift : arr1.shift)
  end

  result.concat(arr1).concat(arr2)
end

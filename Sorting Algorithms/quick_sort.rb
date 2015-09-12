# Given an array of integers, return the sorted array.
# Good to know: Ruby's array sort method more or less uses quick sort.

# Time complexity O(nlog(n))
# Space complexity ?

def quick_sort(array)
  # Base case
  return array if array.length <= 1

  left = []
  right = []

  # Uses random to select a pivot in case the array is already sorted
  # to avoid running in quadriatic time
  pivot_idx = rand(array.length)
  pivot = array[pivot_idx]

  array.each_with_index do |n, i|
    next if i == pivot_idx

    # If n < pivot, put it in the left array, else put it in the right array
    n < pivot ? left << n : right << n
  end

  # Concats the sorted left array with the pivot and the sorted right array
  quick_sort(left).concat([pivot]).concat(quick_sort(right))
end

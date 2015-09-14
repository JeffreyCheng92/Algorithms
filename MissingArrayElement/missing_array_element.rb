# Given an array of non-negative integers and another array
# with the same elements shuffled and one element deleted,
# find the missing element in the second array.

# Eg. arr1 = [1,2,3,4,5]  arr2 = [1,2,3,5]
# => 4

# Time complexity O(n)
# Space complexity O(1)

def missing_element(arr1, arr2)
  result = 0

  # Uses the XOR operator
  # https://en.wikipedia.org/wiki/Exclusive_or
  arr1.each { |num| result ^= num }
  arr2.each { |num| result ^= num }

  result

  # Alternatively, you can sum up the parent array and subtract the sum of the
  # second array. This will work as well, but an issue you run into is if the
  # sum overflows the range of the integer class. Also, the XOR thing is cool :)

  # A hack to get past the overflow issue is if you are subtracting the
  # elements from arr2 as you are summing them in arr1.

  # arr1.inject(:+) - arr2.inject(:+)
end

# Given an array of positive integers, return the sorted array.

# Time complexity O(n)
# Space complexity O(n)

def counting_sort(array)
  # Make a bucket for each element up to the max element in the array
  count = Array.new(array.max + 1, 0)
  results = []

  # Store the count of each number with the index as the new element reference
  array.each { |num| count[num] += 1 }

  # ct is the count of each number and the index is the number itself.
  # Push the number into the results array ct number of times.
  count.each_with_index do |ct, num|
    if ct > 0
      ct.times { results << num }
    end
  end

  return results
end

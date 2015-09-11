# Given an integer array of positive or negative numbers,
# find the largest continuous sum.
# Eg. [1, 1, -3, 3, 5] => 8

# Time complexity O(n)
# Space complexity O(1)

def largest_continuous_sum(array)
  largest_sum = 0
  current_sum = 0

  array.each do |n|
    current_sum += n

    largest_sum = current_sum if current_sum > largest_sum

    # If the current_sum becomes negative,
    # restart the sum at 0 so the negative number won't
    # be added to the next positive number.
    current_sum = 0 if current_sum < 0
  end

  largest_sum
end

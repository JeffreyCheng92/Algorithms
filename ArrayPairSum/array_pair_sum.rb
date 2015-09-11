# Takes in an array of integers and target value, k,
# and return values that sum up to k

# Time complexity O(n)
# Space complexity O(n)

def array_pair_sum(int_array, target)
  results = []
  num_dictionary = {}

  return false if int_array.length < 2

  int_array.each do |num|
    addend = target - num

    # Checks if addend is within the dictionary
    # Otherwise, will just add number to the dictionary

    if num_dictionary[addend] == true
      results << [[addend, num].min, [addend, num].max]
    else
      num_dictionary[num] = true
    end
  end

  return results
end

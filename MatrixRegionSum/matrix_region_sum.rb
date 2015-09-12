# Given an matrix and coordinates for the top left and bottom right
# of the matrix, calculate the sum of the elements within the region.

# Brute force solution
# Time complexity O(mn) where m is number of rows and n is number of columns
# Space complexity O(1)

test_matrix = [ [ 1,  2,  3,  4,  5],
                [ 6,  7,  8,  9, 10],
                [11, 12, 13, 14, 15]
              ]

def brute_region_sum(matrix, top_left, bot_right)
  sum = 0

  (top_left[0]..bot_right[0]).to_a.each do |x|
    (top_left[1]..bot_right[1]).to_a.each do |y|
      sum += matrix[x][y]
    end
  end

  sum
end

# Dynamic Programming solution
# Setting up a new array with the sum values

# Time complexity O(mn) where m is number of rows and n is number of columns
# Space complexity O(n)

def dynamic_setup(matrix)
  array = Array.new(matrix.length) { Array.new }

  (0).upto(matrix.length - 1) do |x|
    (0).upto(matrix.first.length - 1) do |y|
      if x.zero? && y.zero?
        array[x][y] = matrix[x][y]
      elsif x.zero?
        # debugger
        array[x][y] = matrix[x][y] + array[x][y - 1]
      elsif y.zero?
        array[x][y] = matrix[x][y] + array[x - 1][y]
      else
        array[x][y] = matrix[x][y] + array[x - 1][y] +
                      array[x][y - 1] - array[x - 1][y - 1]
      end
    end
  end

  array
end

# Setting up the matrix for use
$array = dynamic_setup(test_matrix)

# Uses dynamic setup matrix to calculate the sum of a matrix region
# Time complexity O(1)
# Space complexity O(1)

def dynamic_region_sum(top_left, bot_right)
  if top_left == [0, 0]
    $array[bot_right[0]][bot_right[1]]
  elsif top_left[0].zero?
    $array[bot_right[0]][bot_right[1]] - $array[bot_right[0]][top_left[1] - 1]
  elsif top_left[1].zero?
    $array[bot_right[0]][bot_right[1]] - $array[top_left[0] - 1][bot_right[1]]
  else
    $array[bot_right[0]][bot_right[1]] -
      $array[bot_right[0]][top_left[1] - 1] -
      $array[top_left[0] - 1][bot_right[1]] +
      $array[top_left[0] - 1][top_left[1] - 1]
  end
end

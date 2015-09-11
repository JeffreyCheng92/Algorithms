# Given an matrix and coordinates for the top left and bottom right
# of the matrix, calculate the sum of the elements within the region.

# Brute force solution
# Time complexity O(mn) where m is number of rows and n is number of columns

def brute_region_sum(matrix, top_left, bot_right)
  sum = 0

  (top_left[0]..bot_right[0]).to_a.each do |x|
    (top_left[1]..bot_right[1]).to_a.each do |y|
      sum += matrix[x][y]
    end
  end

  sum
end

test_matrix = [ [ 1,  2,  3,  4,  5],
                [ 6,  7,  8,  9, 10],
                [11, 12, 13, 14, 15]
              ]

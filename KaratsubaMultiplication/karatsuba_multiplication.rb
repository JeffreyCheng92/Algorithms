# Karatsuba Multiplication
# https://en.wikipedia.org/wiki/Karatsuba_algorithm
# Recursive alternative to standard multiplication

# Time complexity O(n^1.59)
# Source: http://www.geeksforgeeks.org/divide-and-conquer-set-2-karatsuba-algorithm-for-fast-multiplication/
# Better for large numbers

def km(num1, num2)
  if num1 < 10 || num2 < 10
    return num1 * num2
  end

  length = [num1.to_s.length, num2.to_s.length].max / 2

  left1, right1 = num1.to_s[0...length].to_i, num1.to_s[length..-1].to_i
  left2, right2 = num2.to_s[0...length].to_i, num2.to_s[length..-1].to_i

  prod0 = km(left1, left2)
  prod2 = km(right1, right2)
  prod1 = km((left1 + right1), (left2 + right2)) - prod0 - prod2

  return (prod0 * 10**(2 * length)) + (prod1 * 10**(length)) + prod2
end

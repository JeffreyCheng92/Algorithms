# The calculator takes in a string of integers and operations with no spaces
# and returns the evaluated expression.

def calculate(input)
  # Builds an array of numbers and operations
  input_array = input.split("")

  # Joins digits if multiple digits
  (input_array.length - 1).downto(0) do |index|
    if !(input_array[index] =~ /\d+/).nil? &&
        !(input_array[index - 1] =~ /\d+/).nil? && index - 1 >= 0
      input_array[index - 1] += input_array[index]
      input_array.delete_at(index)
    end
  end

  # Stack of the indices of parentheses to evaluate them first
  priority_expressions_idx = []

  # Used to record indices of the close parenthesis
  idx = 0

  # O(n)
  # Records the locations of the parenthesis
  input_array.each_with_index do |el, i|
    if el == "("
      priority_expressions_idx << [i, nil]
    elsif el == ")"
      length = priority_expressions_idx.length - 1

      # Checks the last parenthesis recorded and see if the closed parenthesis
      # was recorded.
      if length - idx >= 0 && priority_expressions_idx[length - idx].last.nil?
        priority_expressions_idx[length - idx][-1] = i
        idx += 1
      end
    else
      next
    end
  end

  # Accounts for the change in the array due to deletions
  change = 0

  # O(n)
  priority_expressions_idx.reverse.each do |exp|
    expression = input_array[exp[0] + 1... exp[1] - change]

    # O(number of elements in expression)
    answer = evaluate(expression)

    # Puts evaluated parenthesis expression into array
    input_array[exp[0]] = answer

    # Deletes evaluated parenthesis expression accounting for previous deletes
    (exp[1] - change).downto(exp[0] + 1) do |i|
      input_array.delete_at(i)
      change += 1
    end
  end

  # Evaluates rest of expression after all parentheses are evaluated
  evaluate(input_array)
end

# Evaluates expressions
# O(n)
def evaluate(input)

  # Evaluates multiplication and division first
  while input.include?("*") || input.include?("/")
    input.each_with_index do |el, i|
      if el == "*"
        answer = times(input[i - 1], input[i + 1])
        input[i - 1] = answer
        input.delete_at(i + 1)
        input.delete_at(i)
      elsif  el == "/"
        answer = divide(input[i - 1], input[i + 1])
        input[i - 1] = answer
        input.delete_at(i + 1)
        input.delete_at(i)
      end
    end
  end

  # Evaluates addition and subtraction after all multiplication and division
  # are completed.
  while input.include?("+") || input.include?("-")
    input.each_with_index do |el, i|
      if el == "+"
        answer = plus(input[i - 1], input[i + 1])
        input[i - 1] = answer
        input.delete_at(i + 1)
        input.delete_at(i)
      elsif el == "-"
        answer = minus(input[i - 1], input[i + 1])
        input[i - 1] = answer
        input.delete_at(i + 1)
        input.delete_at(i)
      end
    end
  end
  input.first.to_s
end

# Math helper functions
def plus(num1, num2)
  num1.to_i + num2.to_i
end

def minus(num1, num2)
  num1.to_i - num2.to_i
end

def times(num1, num2)
  num1.to_i * num2.to_i
end

def divide(num1, num2)
  num1.to_i / num2.to_i
end

# puts calculate("13+14")
# puts calculate("2+(2*(4-(3+(17*3)/3)*1)-5)")

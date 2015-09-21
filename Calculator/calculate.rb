def calculate(input)
  input_array = input.split("")
  priority_expressions_idx = []
  idx = 0

  input_array.each_with_index do |el, i|
    if el == "("
      priority_expressions_idx << [i, nil]
    elsif el == ")"
      length = priority_expressions_idx.length - 1
      if length - idx >= 0 && priority_expressions_idx[length - idx].last.nil?
        priority_expressions_idx[length - idx][-1] = i
        idx += 1
      end
    else
      next
    end
  end

  change = 0
  priority_expressions_idx.reverse.each do |exp|
    expression = input_array[exp[0] + 1... exp[1] - change]
    answer = evaluate(expression)
    input_array[exp[0]] = answer

    (exp[1] - change).downto(exp[0] + 1) do |i|
      input_array.delete_at(i)
      change += 1
    end
  end

  evaluate(input_array)
end

def evaluate(input)
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

puts calculate("2+(2*(4-(3+(7*3)/3)*1)-5)")

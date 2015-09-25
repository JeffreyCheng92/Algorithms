# Given an array of prices, return the buy day and sell day (indices)
# where the stock would make the most profit.
require 'byebug'
def brute_stock_picker(array)
  buy_day = nil
  sell_day = nil
  profit = 0

  array[0..-2].each_with_index do |b, i|
    array[i..-1].each_with_index do |s, j|
      if s - b > profit
        profit = s - b
        buy_day = i
        sell_day = i + j
      end
    end
  end

  [buy_day, sell_day]
end

def stock_picker(array)
  buy_day = 0
  sell_day = nil
  profit = 0


  array[1..-1].each_with_index do |price, day|
    # debugger
    current_profit = (array[buy_day] - price) * -1
    if current_profit > profit
      profit = current_profit
      sell_day = day + 1

    ## RIGHT HERE REHAN
    elsif current_profit < 0
      buy_day = day + 1
    end
  end

  return [buy_day, sell_day]
end

array = [5, 4, 2, 8, 3, 11, 1, 100]
array2 = [3,20,9,1,15,12,16]

p brute_stock_picker(array) == stock_picker(array)
p brute_stock_picker(array2)
p stock_picker(array2)

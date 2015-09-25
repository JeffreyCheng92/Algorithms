# Given an array of prices, return the buy day and sell day (indices)
# where the stock would make the most profit.

# Time complexity O(n^2)
# Space complexity O(1)
def brute_stock_picker(array)
  buy_day = nil
  sell_day = nil
  profit = 0

  array[0..-2].each_with_index do |b, i|
    array[i..-1].each_with_index do |s, j|
      # Compares the current profit against the best profit
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
  # Assumes best day to buy is day 0
  buy_day = 0
  sell_day = nil
  profit = 0
  final_buy_day = nil

  # Starts at index 1 because assumes stock was purchased on day 0
  array[1..-1].each_with_index do |price, day|
    # Gets the current profit between each day and the buy day
    current_profit = (array[buy_day] - price) * -1

    # Compares current profit against profit
    if current_profit > profit
      profit = current_profit

      # Sets new sell_day if current_profit > profit
      sell_day = day + 1

      # Have to record final_buy_day in case buy_day is rewritten when profits
      # are less than 0.
      final_buy_day = buy_day

    # If the current_profit dips below 0, we find a new day to buy
    elsif current_profit < 0
      buy_day = day + 1
    end
  end

  return [final_buy_day, sell_day]
end

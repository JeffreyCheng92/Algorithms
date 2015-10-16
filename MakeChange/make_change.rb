# Make change is a derivation of the common knapsack problem
# (dynamic programming)
# Given a total amount (integer), and an array of coins (integers),
# use the least amount of coins to make change of the total amount

# The cache is used to store the previously solved problems to decrease
# run time and look up answers instead.
def make_change(total, coins, cache={})
  # Base case
  cache[total] = [] if total == 0

  # If the problem has been solved before, just use the solved value.
  return cache[total] if cache[total] || coins.empty?

  best_change = nil

  coins.each do |coin|
    # If the coin is greater than the total, move onto the next coin.
    next if coin > total

    remainder = total - coin
    # Recursive step to solve the sub problems
    rest_of_change = make_change(remainder, coins, cache)

    # The solution to the current total is the largest coin concatenated
    # with the solution of the remainder.
    change = rest_of_change + [coin]

    # Selects the best answer existing.
    if  best_change.nil? || rest_of_change.length < best_change.length
      best_change = change
    end

    # Memoizes the answer for future usage in the stack below it. 
    cache[total] = best_change
  end

  best_change
end

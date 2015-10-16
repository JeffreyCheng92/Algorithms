def make_change(total, coins, cache={})
  cache[total] = [] if total == 0
  return cache[total] if cache[total] || coins.empty?

  best_change = nil

  coins.each do |coin|
    next if coin > total

    remainder = total - coin
    rest_of_change = make_change(remainder, coins, cache)

    change = rest_of_change + [coin]

    if  best_change.nil? || rest_of_change.length < best_change.length
      best_change = change
    end

    cache[total] = best_change
  end

  best_change
end

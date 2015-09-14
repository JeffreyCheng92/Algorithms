# Given three strings, return whether the third is an interleaving of the
# first two. Interleaving means it only contains characters from the other
# two, no more no less, and preserves their character ordering.
#
# Eg. "abdecf" is interleaving of "abc" and "def".
# Note that the first two strings needn't be in alphabetical order like these.

def is_interleaved?(str1, str2, str3, cache = {})
  # Exits if the sum of the lengths of str1 and str2 does not total str3 length
  return false unless (str1.length + str2.length == str3.length)

  # Exits if both first chars of str1 and str2 does not match str3 first char
  return false if (str1[0] != str3[0] && str2[0] != str3[0])

  # Returns false if we have explored paths from str1 and str3 before
  return false if cache.has_key?([str1, str2])

  # Checks the possibility that str1 or str2 is str3 and does run recursive loop
  return true if str1 == str3 || str2 == str3


  # Compares the first letters of str1 and str3 and recursively calls itself
  # to see if str3[1..-1] can be built from the remaining letters
  if str1[0] == str3[0] &&
      is_interleaved?(str1[1..-1], str2, str3[1..-1], cache)

    return true
  end

  if str2[0] == str3[0] &&
      is_interleaved?(str1, str2[1..-1], str3[1..-1], cache)

    return true
  end

  # Adds the currently explored path to the cache to save computation later
  cache[[str1, str2]] = true
  return false
end

puts is_interleaved?("swag", "cool", "scwooagl")

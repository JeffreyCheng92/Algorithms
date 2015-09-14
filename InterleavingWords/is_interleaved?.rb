# Given three strings, return whether the third is an interleaving of the
# first two. Interleaving means it only contains characters from the other
# two, no more no less, and preserves their character ordering.
#
# Eg. "abdecf" is interleaving of "abc" and "def".
# Note that the first two strings needn't be in alphabetical order like these.

def is_interleaved?(str1, str2, str3)
  # Exits if the sum of the lengths of str1 and str2 does not total str3 length
  return false if (str1.length + str2.length != str3.length)

  # Checks the possibility that str1 or str2 is str3 and does run recursive loop
  return true if str1 == str3 || str2 == str3

  # Compares the first letters of str1 and str3 and recursively calls itself
  # to see if str3[1..-1] can be built from the remaining letters
  if str1[0] == str3[0] && is_interleaved?(str1[1..-1], str2, str3[1..-1])
    return true
  end

  if str2[0] == str3[0] && is_interleaved?(str1, str2[1..-1], str3[1..-1])
    return true
  end

  return false
end

# Write a regex that matches the word The when it occurs at the beginning
# of a line. Test it with these strings:

# The lazy cat sleeps.
# The number 623 is not a word.
# Then, we went to the movies.
# Ah. The bus has arrived.

# There should be 2 matches.

regex = /^The\b/
strings = ["The lazy cat sleeps.", "The number 623 is not a word.",
           "Then, we went to the movies.", "Ah. The bus has arrived."]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end
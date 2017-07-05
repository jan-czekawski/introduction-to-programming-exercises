# Write a regex that matches any 3-letter word, where a word is
# comprised entirely of letters. Test it with these strings:

# reds and blues
# The lazy cat sleeps.
# The number 623 is not a word. Or is it?

# There should be 5 matches.

regex = /\b[a-z][a-z][a-z]\b/i
strings = ["reds and blues", "The lazy cat sleeps.",
           "The number 623 is not a word. Or is it?"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end
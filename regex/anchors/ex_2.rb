# Write a regex that matches the word cat when it occurs
# at the end of a line. Test it with these strings:

# The lazy cat sleeps
# The number 623 is not a cat
# The Alaskan drives a snowcat

# There should be 1 match.

regex = /\bcat$/
strings = ["The lazy cat sleeps", "The number 623 is not a cat",
           "The Alaskan drives a snowcat"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end
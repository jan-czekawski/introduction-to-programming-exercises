# Write a regex that matches any sequence of 3 characters delimited
# by whitespace characters. Test it with these strings:

# reds and blues
# the lazy cat sleeps

# There should be 3 matches. => newline between strings cause "the" to match it also

regex = /\s...\s/
strings = ["reds and blues", "the lazy cat sleeps"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end
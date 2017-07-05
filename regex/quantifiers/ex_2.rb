# Write a regex that matches any line of text that ends with a ?.
# Test it with these strings.

# What's up, doc?
# Say what? No way.
# ?
# Who? What? Where? When? How?

# There should be 3 matches.

# regex = /\?$/
regex = /^.*\?$/
strings = [%(What's up, doc?), %(Say what? No way.), "?", %(Who? What? Where? When? How?)]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end
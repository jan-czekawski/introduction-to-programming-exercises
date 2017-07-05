# Write a regex that matches any line of text that ends with a ?,
# but does not match a line that includes nothing but a single ?.
# Test it with the strings from the previous exercise.

# There should be 2 matches.

# regex = /^.{1,}\?$/
regex = /^.+\?$/
strings = [%(What's up, doc?), %(Say what? No way.), "?", %(Who? What? Where? When? How?)]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end
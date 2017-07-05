# Write a regex that matches any sequence of 3 letters. Test it with these strings:

# The red d0g chases the b1ack cat.
# a_b c_d

# There should be 7 matches.

regex = /[a-z][a-z][a-z]/i
strings = ["The red d0g chases the black cat", "a_b c_d"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end
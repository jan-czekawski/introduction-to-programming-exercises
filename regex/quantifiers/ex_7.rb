# Write a regex that matches any word that contains at least 3 occurrences
# of the letter i. Test your regex against these strings:

# There should be 3 matches.

# Mississippi
# inviting
# rigidity
# ziti


# regex = /i.*i.*i/
# regex = /\b\w*i\w*i\w*i\w*\b/
regex = /\b(\w*i){3}\w*\b/
strings = %w(Mississippi inviting rigidity ziti)

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end
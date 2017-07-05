# Write a regex that matches any word that begins with b and ends with an e,
# and has any number of letters in-between. You may limit your regex to
# lowercase letters only. Test it with these strings.

# To be or not to be
# Be a busy bee
# I brake for animals.

# There should be 4 matches.

regex = /\bb[a-z]*e\b/
strings = [%(To be or not to be), %(Be a busy bee), %(I brake for animals.)]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end
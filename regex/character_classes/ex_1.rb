# Write a regex that matches uppercase or lowercase Ks or a lowercase s. Test it with these strings:

# Kx
# Reds and blues
# kitchen implements
# There should be 5 matches.

regex = /[Kks]/
strings = ["Kx", "Reds and blues", "kitchen implements"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end
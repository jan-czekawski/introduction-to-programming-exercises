# Write a regex that matches the last word in each line of text. 
# For the purposes of this exercise, assume that words are comprised 
# of any sequence of non-whitespace characters. Test your regex against
# these strings:

# What's up, doc?
# I tawt I taw a putty tat!
# Thufferin' thuccotath!
# Oh my darling, Clementine!
# Camptown ladies sing this song, doo dah.

# There should be 5 matches.

# regex = /\b\S*$/
regex = /\b\S+\s*$/
strings = ["What's up, doc?", "I tawt I taw a putty tat!",
           "Thufferin' thuccotath!", "Oh my darling, Clementine!",
           "Camptown ladies sing this song, doo dah."]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end
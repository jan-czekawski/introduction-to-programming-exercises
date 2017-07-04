# Write a regex that matches a comma or a space. Test your regex with these strings:

# This line has spaces
# This,line,has,commas,
# No-spaces-or-commas

words = ["This line has spaces", "This,line,has,commas", "No-spaces-or-commas"]
regex = /(,| )/

words.each do |word|
  if word.match(regex)
    puts "#{word} matches that pattern!"
  else
    puts "#{word} does not match that pattern!"
  end
end
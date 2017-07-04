# Write a regex that matches any of the following fruits: banana,
# orange, apple, strawberry. The fruits may appear inside other words.
# Test it with these strings:

# banana
# orange
# pineapples
# strawberry
# raspberry
# grappler


words = ["banana", "orange", "pineapples", "strawberry", "raspberry", "grappler"]
regex = /(banana|orange|apple|strawberry)/

words.each do |word|
  if word.match(regex)
    puts "#{word} matches that pattern!"
  else
    puts "#{word} does not match that pattern!"
  end
end
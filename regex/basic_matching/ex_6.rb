# Challenge: Write a regex that matches "blueberry" or "blackberry",
# but do so by writing berry only once. Test it with these strings:

# blueberry
# blackberry
# black berry
# strawberry

words = ["blueberry", "blackberry", "black berry", "strawberry"]
regex = /(blue|black)berry/

words.each do |word|
  if word.match(regex)
    puts "#{word} matches that pattern!"
  else
    puts "#{word} does not match that pattern!"
  end
end
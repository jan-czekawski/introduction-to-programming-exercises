# Write a regex that matches the string "dragon". Test it with these strings:

# snapdragon
# bearded dragon
# dragoon

words = ["snapdragon", "bearded dragon", "dragoon"]
regex = /dragon/

words.each do |word|
  if word.match(regex)
    puts "#{word} matches that pattern!"
  else
    puts "#{word} does not match that pattern!"
  end
end
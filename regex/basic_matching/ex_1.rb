# Write a regex that matches an uppercase K. Test it with these strings:

# Kx
# BlacK
# kelly

words = ["Kx", "BlacK", "kelly"]

words.each do |word|
  if word.match(/K/)
    puts "#{word} matches that pattern!"
  else
    puts "#{word} does not match that pattern!"
  end
end
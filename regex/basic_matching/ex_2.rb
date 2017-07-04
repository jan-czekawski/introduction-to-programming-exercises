# Write a regex that matches an uppercase or lowercase H. Test it with these strings:

# Henry
# perch
# golf

words = ["Henry", "perch", "golf"]

words.each do |word|
  if word.match(/h/i)
    puts "#{word} matches that pattern!"
  else
    puts "#{word} does not match that pattern!"
  end
end
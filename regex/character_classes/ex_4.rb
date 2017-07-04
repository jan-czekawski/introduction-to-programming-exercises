# Write a regex that matches any letter except x or X. Test it with these strings:

# 0x1234
# Too many XXXXXXXXXXxxxxxxXXXXXXXXXXXX to count.
# The quick brown fox jumps over the lazy dog
# THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG
# There should be 82 matches.


regex = /[a-wyzA-WYZ]/
strings = ["0x1234",
           "Too many XXXXXXXXXXxxxxxxXXXXXXXXXXXX to count.",
           "The quick brown fox jumps over the lazy dog",
           "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end
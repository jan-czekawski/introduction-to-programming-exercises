TEST_STR = "abc is not cba"

p "--match--"
p b = /[abc]/.match(TEST_STR)
p "--scan--"
p TEST_STR.scan(/[abc]/)

a = TEST_STR.scan(/[abc]/) { |c| print c.upcase }
puts ""
p a


regex1 = Regexp.new("^[a-z]*$")
regex2 = /^[a-z]*$/
regex3 = %r(^[a-z]*$)

p regex1
p regex1 == regex2
p regex1 == regex3

def test_reg(str, reg)
  if reg =~ str
    puts "All lowercase"
  else
    puts "Not all lowercase"
  end
end

# first full-line comment
# second full-line comment

test_reg("hello", regex1) # not full-line comment
test_reg("hello", regex2)
test_reg("Hello", regex3)

p /^[a-z 0-9]*$/ =~ "well hello 123"
p /^[a-z 0-9]*$/ =~ "well h-ello 123"
p /^[a-z 0-9]*$/ =~ "Well hello 123"

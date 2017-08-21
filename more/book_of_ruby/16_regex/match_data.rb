x = /(^.*)(#)(.*)/.match("def my_method # This is very nice method")
p x

p x.to_a
p "AND .CAPTURES"
p x.captures
p x.captures.each { |item| puts item }
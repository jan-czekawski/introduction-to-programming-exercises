str = "HELLO WORLD"

case str
when /^[a-z 0-9]$/
  puts "all lower case"
when /^[A-Z 0-9]$/
  puts "all uppercase"
else
  puts "mixed case"
end
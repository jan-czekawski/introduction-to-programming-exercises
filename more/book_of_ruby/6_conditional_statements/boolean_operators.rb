# || has higher precedence than "and"
if 1 == 3 and 2 == 1 || 3 == 3
  puts "true"
else
  puts "false"
end

# "and", "or" have the same precedence
if 1 == 3 and 2 == 1 or 3 == 3
  puts "true"
else
  puts "false"
end

puts (not( 1 == 1 ))
puts not( 1 == 1 )

puts "errors"
puts true && true && !true       # => false
puts true && true and !true      # => true
puts( true && true && !true )    # => false
# puts( true && true and !true ) # => syntax error

puts "more errors"
puts( true && true )             # => true
# puts( true and true )          # => syntax error
puts( ((true) and (true)) )      # => true
puts true and true               # => true

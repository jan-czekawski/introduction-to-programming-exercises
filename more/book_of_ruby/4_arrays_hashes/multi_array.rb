multi_arr = [ [1, 2, 3, 4],
              %w(one two three four) ]
     
puts "for i in" 
for i in multi_arr
  puts i.inspect
end

puts "for (a, b, c, d) in"
# for (a, b, c, d) in multi_arr         # => same result => no need for array decomposition
# for a, b, c, d, e, f, g in multi_arr  # => others are ignored
# for a, b, c, e, d in multi_arr        # => d get's nil
for a, b, c, d in multi_arr
  print "a=#{a}, b=#{b}, c=#{c}, d=#{d}\n"
end
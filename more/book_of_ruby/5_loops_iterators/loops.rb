multi_arr = [ [1, 2, 3, 4], %w(one two three four) ]

p "four elements"
multi_arr.each do |a, b, c, d|
  p "a=#{a}, b=#{b}, c=#{c}, d=#{d}"
end

p "one element"
multi_arr.each do |a|
  p "a=#{a}"
end

p "two elements"
multi_arr.each do |a, b|
  p "a=#{a}, b=#{b}"
end
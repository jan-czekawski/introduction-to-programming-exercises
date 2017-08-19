$outer_count = 0

def add_up(num)
  num += 1
  $outer_count += 1
  puts "num is #{num}, $outer_count is #{$outer_count}"
  
  if $outer_count < 3
    add_up(num)       # => recursive call
  end
  
  puts "At END: num is #{num}, $outer_count is #{$outer_count}"
end

add_up(0)
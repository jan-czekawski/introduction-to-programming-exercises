def count_to_zero(num)
  puts num
  count_to_zero(num - 1) if num > 0
end

count_to_zero(50)
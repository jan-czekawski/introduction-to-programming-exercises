def count_to_zero(num)
  puts num
  return if num <= 0
  count_to_zero(num - 1)
end

count_to_zero(50)
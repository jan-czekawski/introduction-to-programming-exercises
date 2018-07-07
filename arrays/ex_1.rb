# can be
arr = [1, 3, 5, 7, 9, 11]
number = 3

def array_contains(array, num)
  if array.include?(num)
    puts "#{num} is in fact in the array."
  else
    puts "Array does not include #{num}"
  end
end

array_contains(arr, number)
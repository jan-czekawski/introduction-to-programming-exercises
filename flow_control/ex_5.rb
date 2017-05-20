def range_if(num)
  if num < 0
    puts "You picked negative number!"
  elsif num <= 50
    puts "You picked number between 0 and 50!"
  elsif num <= 100
    puts "You picked number between 51 and 100!"
  else
    puts "You picked number greater than 100!"
  end
end

def range_case(num)
  case
  when num < 0
    puts "You picked negative number!"
  when num <= 50
    puts "You picked number between 0 and 50!"
  when num <= 100
    puts "You picked number between 51 and 100!"
  else
    puts "You picked number greater than 100!"
  end
end

puts "Pick a number between 0 and 100:"
picked_number = gets.chomp.to_i

range_case(picked_number)
range_if(picked_number)
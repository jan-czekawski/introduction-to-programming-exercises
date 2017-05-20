puts "Pick a number between 0 and 100:"
num = gets.chomp.to_i

if num < 0
  puts "You picked negative number!"
elsif num <= 50
  puts "You picked number between 0 and 50!"
elsif num <= 100
  puts "You picked number between 51 and 100!"
else
  puts "You picked number greater than 100!"
end
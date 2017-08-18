catch(:done) do
  puts "This is done"
end

catch(:finished) do 
  puts "This is finished"
end

# catch(:taken) do
#   print "Enter number: "
#   num = gets.chomp.to_i
#   throw(:taken) if num == 0
#   puts "Your number is #{num}"
# end
# puts "You're finished!"
def do_things(num)
  i = 0
  while true
    puts "I'm doing things"
    i += 1
    throw(:go_for_tea) if i == num
  end
end

catch(:go_for_tea) do
  puts "I'm drinking my tea"
  do_things(3)
end

catch(:whole) do
  print "Enter a number: "
  num = gets.chomp.to_i
  throw(:whole) if num == 0
  puts 100 / num
  
  catch(:go_for_tea) do
    do_things(5)
  end
  
  puts "Things have all been done. Time for tea!"
end
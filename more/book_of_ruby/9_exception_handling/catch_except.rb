catch(:finished) do
  print "Enter a number: "
  num = gets.chomp.to_i
  begin
    result = 100 / num
  rescue => e
    throw(:finished) # jump to end of the block
  end
  puts "The result of that calculation is #{result}"
end # end of the :finished catch block
def calc(val1, val2)
  # begin
    result = val1 / val2
  rescue TypeError, NoMethodError => e
    puts e.class
    puts e
    puts "One of the values is not a number!"
    result = nil
  rescue Exception => e
    puts e.class
    puts e
    result = nil
  # end
  # return result
  result
end

p calc(20, 0)
p calc(20, "100")
p calc("100", 100)
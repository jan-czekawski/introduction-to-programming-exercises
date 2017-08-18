begin
  raise ZeroDivisionError.new("I'm afraid you divided by zero!")
rescue => e
  puts e.class
  puts "message: " + e.to_s
  p e
  p e.to_s
end
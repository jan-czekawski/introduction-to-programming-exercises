def calc(val1, val2)
  begin
    result = val1 / val2
  rescue Exception => e
    puts e.class
    puts e
    result = nil
  end
  return result
end

p calc(20, 0)
p calc(20, "100")
p calc("100", 100)
def do_calc(num)
  begin
    result = 100 / num.to_i
  rescue => e
    result = 0
    msg = "Error: " + e.to_s
  else
    msg = "Result = #{result}"
  ensure
    msg = "You entered '#{num}'. " + msg
  end
  return msg
end

p do_calc(10)
p do_calc(0)
p do_calc("home")
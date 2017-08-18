def do_calc
  tries = 0
  begin
    print "Enter a number: "
    tries += 1
    num = gets.chomp
    result = 100 / num.to_i
  rescue => e
    msg = "Error: " + e.to_s
    puts msg
    puts "tries = #{tries}"
    result = 0
    retry if tries < 3
  else
    msg = "Result = #{result}"
  ensure
    msg = "You entered '#{num}'. " + msg
  end
  msg
end

p do_calc
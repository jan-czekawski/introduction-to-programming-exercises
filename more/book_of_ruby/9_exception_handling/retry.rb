def do_calc
  # count = 0
  begin
    # count += 1
    print "Enter a number: "
    num = gets.chomp
    result = 100 / num.to_i
  rescue => e
    result = 0
    puts "Error: " + e.to_s + "\nPlease try again."
    # retry if count < 5
    retry
  else
    msg = "Result = #{result}"
  ensure
    msg = "You entered '#{num}'. " + msg
  end
  msg
end

p do_calc
def handle_error(e)
  puts "Error of type: #{e.class}"
  puts e
  puts "Here is a backtrace: "
  puts e.backtrace
end

def div_by_zero
  1 / 0
end

begin
  div_by_zero
rescue => e
  puts "A problem just occured. Please wait..."
  x = 0
  begin
    # raise 
    raise NoMethodError
  rescue
  # rescue => f
    handle_error(e)
    # handle_error(f)
  end
end


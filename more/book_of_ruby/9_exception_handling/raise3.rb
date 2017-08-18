class NoNameError < StandardError
  def to_s
    "No Name given!"
  end
end

def say_hello(name)
  begin 
    if name == "" || name.nil?
      raise NoNameError
    end
  rescue => e
    puts e.class
    puts "error message: " + e.to_s
    puts e.backtrace
  else
    puts "Hello #{name}!"
  end
end

say_hello(nil)
say_hello("Mark")
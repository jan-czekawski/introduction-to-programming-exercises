ob = Object.new

# singleton class
class << ob
  def blather(str)
    puts "blather, blather #{str}"
  end
end

ob.blather("weeble!")


ob2 = Object.new

# singleton method
def ob2.blather(str)
  puts "gripity, gripity #{str}"
end

ob2.blather("ping!")
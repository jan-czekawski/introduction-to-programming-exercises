FILENAME = "test2.sav"

class X
  def marshal_dump
    [@x]
  end
  
  def marshal_load(data)
    @x = data[0]
  end
end

ob = X.new

# a) if file exists, load data into ob - a generic X object
if File.exist?(FILENAME)
  File.open(FILENAME) do |f|
    ob = Marshal.load(f)
  end
else
  puts "Saved data can't be found"
end

# b) now transform ob in a singleton
class << ob
  def xxx=(str)
    @x = str
  end
  
  def xxx
    @x
  end
end

if ob.xxx == "hello"
  ob.xxx = "goodbye"
else
  ob.xxx = "hello"
end

File.open(FILENAME, "w") do |f|
  Marshal.dump(ob, f)
end


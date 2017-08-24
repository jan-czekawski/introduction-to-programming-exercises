FILENAME = "test2.sav"

class X
  def marshal_dump
    [@x]
  end
  
  def marshal_load(data)
    @x = data[0]
  end
end

# ob = Array.new
# ob = String.new
# ob = Hash.new
# ob = BasicObject.new
ob = Object.new

p ob, ob.singleton_methods

# a) if file exists, load data into ob - a generic X object
if File.exist?(FILENAME)
  File.open(FILENAME) do |f|
    ob = Marshal.load(f)
  end
else
  puts "Saved data can't be found"
end

p ob, ob.singleton_methods

# b) now transform ob in a singleton
def make_into_singleton(some_ob)
  class << some_ob
    def xxx=(str)
      @x = str
    end
    
    def xxx
      @x
    end
  end
  # some_ob
end

make_into_singleton(ob)

p ob, ob.singleton_methods

if ob.xxx == "hello"
  ob.xxx = "goodbye"
else
  ob.xxx = "hello"
end

p ob, ob.singleton_methods

File.open(FILENAME, "w") do |f|
  Marshal.dump(ob, f)
end


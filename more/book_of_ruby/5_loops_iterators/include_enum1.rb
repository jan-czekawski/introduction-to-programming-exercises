class MyCollection
  include Enumerable
  
  def initialize(items)
    @items = items
  end
  
  def each      # => if not defined => error
    @items.each { |i| yield(i) }
  end
end

p arr = MyCollection.new([10, 20, 30, 40])
p arr.min
p arr.each { |num| p num**2 }
p arr.map { |num| num + 100 }

p "ARR OF STRINGS"
p things = MyCollection.new(["x", "yz", "defgh", "ij", "klmno"])
p things.min
p things.max
p things.map { |i| i.upcase }

class MyCollection
  def min
    @items.to_a.min { |a, b| a.length <=> b.length }
  end
  
  def max
    @items.to_a.max { |a, b| a.length <=> b.length }
  end
end

p "AFTER OVERRIDE"
p things
p things.min
p things.max

# p things.add("home")
class MyCollection
  def add(*arg)
    @items += arg
    # @items += (arg) # => same result
  end
  
  alias :+ :add
end

p things.add("home")
p things.add("boy", "just")
p things
p things + "jerry"
p things + "tom", "jones", "chuck"  # => only "tom" is added, "jones" and "chuck" are printed
# p things + ("tom", "jones", "chuck") # => error
p things.+("tom", "jones", "chuck")
# p things. +("tom", "jones", "chuck") # => same result
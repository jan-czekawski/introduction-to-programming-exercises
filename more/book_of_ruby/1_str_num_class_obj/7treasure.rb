class Thing
  def name=(value)
    @name = value
  end
  
  def name
    @name
  end
end

class Treasure
  def initialize(name, description)
    @name = name
    @description = description
  end
  
  def to_s # override default to_s method
    "The #{@name} Treasure is #{@description}\n"
  end
end

thing1 = Thing.new
thing1.name = "A lovely Thing"
puts thing1.name

t1 = Treasure.new("Sword", "an Elvish weapon forged of gold")
t2 = Treasure.new("Ring", "a magic ring of great power")

puts t1.to_s
puts t2.to_s

# look inside of an object
puts "Inspecting 1st treasure: #{t1.inspect}"

# class where to_s is not overriden
class NewThing
  def initialize(name)
    @name = name
  end
end

puts Class.to_s
puts Object.to_s
puts String.to_s
puts 100.to_s
puts NewThing.to_s

n = NewThing.new("Harry")
puts n
p n
class Thing
  @@num_things = 0
  
  attr_reader :name, :description
  attr_writer :description # not necessary @description is modified with <<
  
  def initialize(name, description)
    @name = name
    @description = description
    @@num_things += 1
  end
  
  def to_s
    "(Thing.to_s):: The #{@name} Thing is #{@description}"
  end
  
  def show_classvars
    "There are #{@@num_things} Thing objects in this game"
  end
end

class Treasure < Thing
  attr_accessor :value
  
  def initialize(name, description, value)
    super(name, description)
    @value = value
  end
end

class Room < Thing
  # TODO: Add room behaviour
end

class Map
  def initialize(rooms)
    @rooms = rooms
  end
  
  def to_s
    @rooms.each { |room| puts room }
  end
end

# create:

# treasures
t1 = Treasure.new("Sword", "an Elvish weapon", 800)
t2 = Treasure.new("Dragon Horde", "a huge pile of jewels", 550)

# rooms
room1 = Room.new("Crystal Grotto", "glittery cavern")
room2 = Room.new("Wasps Dungeon", "dark, enigmatic cave where wasps queen lives")
room3 = Room.new("Thieves Tavern", "mysterious location for all tradesmen")

# map 
my_map = Map.new([room1, room2, room3])

# see what we got
puts "\nLet's inspect the treasures..."
puts "This is the treasure 1: #{t1.inspect}"
puts "This is the treasure 2: #{t2.inspect}"
puts "\nLet's try out the Thing.to_s method..."
puts "Yup, treasure 2 is #{t2.to_s}"
puts "\nLet's see how accessors work..."
puts "We'll evaluate this:"
puts "t1 name=#{t1.name}, description=#{t1.description}, value=#{t1.value}"
puts 't1 name=#{t1.name}, description=#{t1.description}, value=#{t1.value}'
puts "\nChange value of t1 and description."
t1.value = 100
t1.description << " (now somewhat tarnished)"
puts "t1 (NOW) name=#{t1.name}, description=#{t1.description}, value=#{t1.value}"
puts "\nNow let's take a look at room1..."
puts "room1 name=#{room1.name}, description=#{room1.description}"
puts "\nAnd the map..."
puts "my_map = #{my_map.to_s}"
puts "\nFinally, let's check how many Thing objects we've created..."
puts t1.show_classvars

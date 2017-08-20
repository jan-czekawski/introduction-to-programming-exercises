require "yaml"

class Thing
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def describe
    print "#{self.name}"
  end
end

class Treasure < Thing
  attr_accessor :value
  
  def initialize(name, value)
    super(name)
    @value = value
  end
  
  def describe
    super
    print " (worth #{@value} groats). "
  end
end

class Room < Thing
  attr_accessor :treasures
  
  # @treasures will be an array
  def initialize(name, some_treasures)
    super("\n#{name}")
    @treasures = some_treasures
  end
  
  def describe
    super
    if @treasures.size == 0
      print " which is empty."
    else
      print " which contains: "
      @treasures.each { |treasure| treasure.describe }
    end
  end
end

class Map
  # @rooms will be an array - ordered list of Room objects
  def initialize(rooms)
    @rooms = rooms
  end
  
  # to_s method iterates over all the Room objects in @rooms and prints
  # info on each
  def describe
    print "This is a map containing these locations:"
    @rooms.each { |room| room.describe }
  end
end

# create few objects
# # treasures
t1 = Treasure.new("A sword", 800)
t2 = Treasure.new("A dragon Horde", 550)
t3 = Treasure.new("An Elvish Ring", 3000)

# # rooms
room1 = Room.new("Crystal Groto", [])
room2 = Room.new("Dark Cave", [t1])
room3 = Room.new("Forest Glade", [t2, t3])

# # map => array containing the Rooms just created
my_map = Map.new([room1, room2, room3])

File.open("game.yml", "w") do |f|
  YAML.dump(my_map, f)
end

my_map = Map.new([]) # empty the map after saving 
puts "Game saved. \nBefore reloading... "
my_map.describe

File.open("game.yml") do |f|
  my_map = YAML.load(f)
end

puts "\n\nAfter reloading... "
my_map.describe

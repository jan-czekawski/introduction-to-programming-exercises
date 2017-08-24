class Thing
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def describe
    print "#{name}"
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
    print " (worth #{value} groats). "
  end
end

class Room < Thing
  attr_accessor :treasures
  
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
      treasures.each { |treasure| treasure.describe }
    end
  end
end

class Map
  def initialize(rooms)
    @rooms = rooms
  end
  
  def describe
    print "This is a map containing these locations:"
    @rooms.each { |room| room.describe }
  end
end

puts "Game start"

@t1 = Treasure.new("A sword", 800)
@t4 = Treasure.new("potto", 500)
@t2 = Treasure.new("A dragon Horde", 550)
@t3 = Treasure.new("An Elvish Ring", 3000)
@t4 = Treasure.new("wombat", 10000)
@t5 = Treasure.new("ant", 2)
@t6 = Treasure.new("sproggit", 400)

@room1 = Room.new("Crystal Grotto", [])
@room2 = Room.new("Dark Cave", [@t1])
@room3 = Room.new("Forest Glade", [@t2, @t3])

@mymap = Map.new([@room1, @room2, @room3])
@treasures = [@t1, @t2, @t3]

p @mymap
@mymap.describe
p "Game end"
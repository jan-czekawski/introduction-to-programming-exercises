module TestMod
  class Adventure
    # Thing
    class Thing
      attr_accessor :name
      
      def initialize(name)
        @name = name
      end
      
      def describe
        print "#{name}"
      end
    end
    
    # Treasure
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
    
    # Room
    class Room < Thing
      # TODO: add room-specifici behaviour
      attr_accessor :treasures
      
      def initialize(name, treasures)
        super("\n#{name}")
        @treasures = treasures
      end
      
      def describe
        super
        if treasures.length == 0
          print " which is empty."
        else
          print " which contains: "
          treasures.each { |treasure| treasure.describe }
        end
      end
    end
    
    # Map
    class Map
      def initialize(rooms)
        @rooms = rooms
      end
      
      def describe
        print "This is a map containing these locations:"
        @rooms.each { |room| room.describe }
      end
    end
    
    def initialize
      @t1 = Treasure.new("A sword", 800)
      @t2 = Treasure.new("A dragon horde", 300)
      @t3 = Treasure.new("A ring", 3000)
    
      @room1 = Room.new("Baryla", [])
      @room2 = Room.new("Solna", [@t1])
      @room3 = Room.new("Szymanowskiego", [@t2, @t3])
    
      @my_map = Map.new([@room1, @room2, @room3])
      @treasures = [@t1, @t2, @t3]
    end
    
    def map
      @my_map
    end
    
    def treasures
      @treasures
    end
    
    def end_game
      puts "\nAt the end of the game map is: "
      p @my_map
      puts "Destroying map..."
      @my_map = []
      puts "Map is now: "
      p @my_map
    end
    
  end
  
end
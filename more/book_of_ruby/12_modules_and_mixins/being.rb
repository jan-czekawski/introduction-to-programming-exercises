class Being
  include Comparable # => comment out causes NoMethodError
  
  BEINGS = ["hobbit", "dwarf", "elf", "orc", "giant", "oliphant", "dragon"]
  
  attr_accessor :name
  
  def <=>(another_name)
    BEINGS.index(@name) <=> BEINGS.index(another_name.name)
  end
  
  def initialize(name)
    @name = name
  end
end

elf = Being.new("elf")
orc = Being.new("orc")
giant = Being.new("giant")

p elf < orc
p elf > giant
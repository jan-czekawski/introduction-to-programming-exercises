class Thing
  # attr_reader :description
  # attr_writer :description
  attr_accessor :description
  attr_writer :name
  
  def initialize(name, description)
    @name = name
    @description = description
  end
  
  def name
    @name.capitalize
  end
  
end

class Treasure < Thing
  attr_accessor :value
  
  def initialize(name, description)
    super(name, description)
  end
  
end

t1 = Treasure.new("necklace", "gold jewelry")
p t1
t1.value = "Hundert dollars"
p t1
p t1.value
p t1.name
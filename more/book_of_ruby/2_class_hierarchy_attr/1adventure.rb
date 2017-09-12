class Thing
  def initialize(name, description)
    @name = name
    @description = description
  end
  
  def name=(value)
    @name = value
  end
  
  def name
    @name
  end
  
  def description=(value)
    @description = value
  end
  
  def description
    @description
  end
end
  
# class Thing
#   attr_reader :description
#   attr_writer :description
  
#   # and both of them sum to:
#   attr_accessor :description
# end

class Treasure < Thing
  def initialize(name, description, value)
    super(name, description)
    @value = value
  end
  
  def value=(value)
    @value = value
  end
  
  def value
    @value
  end
end

gold = Treasure.new("Dollars", "Many Many", "1000")
wheel = Thing.new("Wheel of the car", "Component of the automobile")

p gold
p wheel
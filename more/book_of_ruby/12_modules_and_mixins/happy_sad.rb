module Happy
  def self.mood
    "happy"
  end
  
  def expression
    "smiling"
  end
end

module Sad
  def self.mood
    "sad"
  end
  
  def expression
    "frowning"
  end
end

class Person
  include Happy
  include Sad
  attr_accessor :mood
  
  def initialize
    @mood = Happy.mood
  end
end

p1 = Person.new
p p1
p p1.expression
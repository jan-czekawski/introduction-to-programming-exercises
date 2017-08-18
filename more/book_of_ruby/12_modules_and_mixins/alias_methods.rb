module Happy
  def self.mood
    "happy"
  end
  
  def expression
    "smiling"
  end
  
  alias happy_expression expression
end

module Sad
  def self.mood
    "sad"
  end
  
  def expression
    "frowning"
  end
  
  alias sad_expression expression
end

class Person
  include Happy
  include Sad
  attr_accessor :mood
  def initialize
    @mood = Happy.mood
  end
end

p2 = Person.new
p p2
p p2.mood
p p2.expression
p p2.happy_expression
p p2.sad_expression
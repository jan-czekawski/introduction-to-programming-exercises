module MagicThing
  attr_accessor :power
end

module Treasure
  attr_accessor :value
  attr_accessor :owner
end

class Weapon
  attr_accessor :deadliness
end

class Sword < Weapon    # descend from Weapon
  include Treasure      # mix in Treasure
  include MagicThing    # mix in MagicThing
  attr_accessor :name
end

s = Sword.new
p s

s.name = "Excalibur"
s.deadliness = "fatal"
p s

s.value = 1000
s.owner = "Gribbit The Dragon"
s.power = "Glows when Orcs appear"
p s

p s.name
p s.deadliness
p s.value
p s.owner
p s.power

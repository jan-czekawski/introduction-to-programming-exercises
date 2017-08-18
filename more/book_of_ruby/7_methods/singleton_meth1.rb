class Creature
  def initialize(speech)
    @speech = speech
  end
  
  def talk
    puts @speech
  end
end

cat = Creature.new("meoowwww")
dog = Creature.new("wooofff")
budgie = Creature.new("Who's a pretty boy, then!")
werewolf = Creature.new("growl")

def werewolf.howl
  if FULLMOON
    puts "How-oo-oo-oo-oo!"
  else
    talk
    # self.talk     # => same results for both
    # werewolf.talk
  end
end

FULLMOON = true # => or false
werewolf.howl
# dog.howl  # => error

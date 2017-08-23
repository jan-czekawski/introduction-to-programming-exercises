module MyModule
  REWARD = 100
  
  def prize
    return "You've won #{REWARD} credits!"
  end
end

def MyModule.lose
  return "Sorry you didn't win!"
end

p MyModule.lose

begin
  p prize           # => error
rescue => e
  p e
end

begin
  p MyModule.prize  # => error
rescue => e
  p e
end

include MyModule
p prize
p MyModule.prize
p 10.prize
p "home".prize
p self.prize

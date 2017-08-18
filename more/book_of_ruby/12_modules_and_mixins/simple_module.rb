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
# p prize           # => error
# p MyModule.prize  # => error

module MyModule
  GOOD_MOOD = "happy"
  BAD_MOOD = "grumpy"
  
  def greet
    "I'm #{GOOD_MOOD}. How are you?"
  end
  
  def MyModule.greet
    "I'm #{BAD_MOOD}. How are you?" 
  end
end

# p GOOD_MOOD # => EROOR
p MyModule::GOOD_MOOD
include MyModule
p greet
p MyModule.greet
p GOOD_MOOD, BAD_MOOD

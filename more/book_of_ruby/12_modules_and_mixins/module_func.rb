module MyModule
  def say_hi
    "hi!"
  end
  
  def say_goodbye
    "goodbye!"
  end

  module_function :say_hi
end

# p MyModule.say_goodbye
p MyModule.say_hi

class MyClass
  include MyModule
  
  def speak
    p say_hi
    p say_goodbye
  end
end

ob = MyClass.new
ob.speak
p MyModule.say_hi
# p MyModule.say_goodbye

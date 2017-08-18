require "./1modules"

class MyClass
  include MyModule
  
  def say_hi
    p greet
  end
end

obj = MyClass.new
obj.say_hi
p obj.greet

p "NEXT"

p MyClass.greet
p greet
p MyModule.greet
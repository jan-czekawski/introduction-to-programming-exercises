class MyClass
  def say_hello
    "Hello from MyClass"
  end
  
  def say_goodbye
    "Goodbye from MyClass"
  end
end

class MyOtherClass < MyClass
  def say_hello # => overrides method from superclass
    "Hello from MyOtherClass"
  end
  
  def say_goodbye # => overrides method, but first calls that method with super
    super << " and also from MyOtherClass"  # => and appends more string
  end
  
  def to_s # => override default to_s
    "I am an instance of the #{self.class} class"
  end
end

p "SUPERCLASS"
p MyClass.new.say_hello
p MyClass.new.say_goodbye
p "AND SUBCLASS"
p MyOtherClass.new.say_hello
p MyOtherClass.new.say_goodbye
p MyOtherClass.new.to_s
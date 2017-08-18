class MyClass
  # definition of instance method
  def my_instance_method
    puts "This is instance method"
  end
end

# creating an object
obj = MyClass.new
# invoking method on object
obj.my_instance_method

class MyClass
  # defining class method
  # def MyClass.class_method_1
  def self.class_method_1
    puts "This is first class method"
  end
  
  # defining class method in a different way
  class << self
    def class_method_2
      puts "This is second class method"
    end
  end
end

# invoke class methods on the class directly
MyClass.class_method_1
MyClass.class_method_2

obj2 = MyClass.new
p obj2

# one way to define singleton method (inside singleton class)
class << obj2
  def first_singleton_method
    puts "And this is first singleton method"
  end
end

# another way to define singleton method
def obj2.second_singleton_method
  puts "And this is second singleton method"
end

obj2.my_instance_method
obj2.first_singleton_method

begin
  obj.first_singleton_method
rescue => e
  p e
end

obj2.second_singleton_method

begin
  obj.second_singleton_method
rescue => e
  p e
end
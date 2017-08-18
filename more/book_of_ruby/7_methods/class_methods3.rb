class MyClass
  # def self.method_a
  def MyClass.method_a
    puts "a"
  end
  
  class << self
    def method_b
      puts "b"
    end
    
    def method_c
      puts "c"
    end
  end
end

obj = MyClass.new
p obj.methods.grep(/method_(a|b|c)/)
p MyClass.singleton_methods
p MyClass.methods.grep(/method_(a|b|c)/)

class << MyClass
  def method_d
    puts "d"
  end
end

p MyClass.singleton_methods
MyClass.method_a
MyClass.method_b
MyClass.method_c
MyClass.method_d


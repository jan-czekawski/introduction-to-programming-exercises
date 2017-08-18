class MyClass
  attr_accessor :name
  attr_accessor :number
  
  def initialize(name, number)
    @name   = name
    @number = number
  end
  
  def ten
    10
  end
end

ob = MyClass.new("James Bond", "007")
puts "My name is #{ob.name} and my number is #{ob.number}"
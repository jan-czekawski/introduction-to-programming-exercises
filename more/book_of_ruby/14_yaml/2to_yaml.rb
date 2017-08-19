require "yaml"

class MyClass
  def initialize(int, str)
    @my_int = int
    @my_str = str
  end
end

ob1 = MyClass.new(100, "hello world").to_yaml
puts ob1

puts ["a1", "a2", "a3"].to_yaml
puts a = { "fruit" => "banana", "vegetable" => "cabbage", "number" => 3 }
a = { "fruit" => "banana", "vegetable" => "cabbage", "number" => 3 }.to_yaml
puts a
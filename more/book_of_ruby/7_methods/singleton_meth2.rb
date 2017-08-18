class MyClass
  def initialize(str)
    @msg = str
  end
  
  def say_something
    puts @msg
  end
end

starprize = MyClass.new("Star Prize")

# SINGLETON METHOD
def starprize.congratulate
  puts "You've won a fabulous holiday in Grimsby!"
end


# SINGLETON CLASS (with congratulate method)
# class << starprize
#   def congratulate
#     puts "You've won a fabulous holiday in Grimsby!"
#   end
# end

boxes = [MyClass.new("box1 is empty"),
         MyClass.new("box2 is empty"),
         starprize,
         MyClass.new("box3 is empty")]
         
boxes.each do |item|
  item.say_something
  item.congratulate if item.singleton_methods.include?(:congratulate)
  # item.congratulate if item.respond_to?(:congratulate)
end

p starprize.singleton_methods
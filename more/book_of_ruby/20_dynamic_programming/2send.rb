class MyString < String
  def initialize(str)
    # super
    super(str)
  end
  
  def show
    puts self
  end
  
  def rev
    puts self.reverse
  end
end

print "Enter your name: " # Fred
name = MyString.new(gets)
print "Enter a method name: " # rev
method_name = gets.chomp.to_sym
puts name.send(method_name)
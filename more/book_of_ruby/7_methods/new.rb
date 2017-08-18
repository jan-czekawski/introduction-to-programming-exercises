class MyClass
  def initialize(aStr)
    @avar = aStr
  end
  
  def MyClass.new(aStr)
    super
    @anewvar = aStr.swapcase
  end
end

ob = MyClass.new("hello world")
p ob
p ob.class

# class of every class is Class
p String.class
p Array.class
# etc
# but superclass of every class is different
p String.superclass
p Integer.superclass

p Class.singleton_methods
p Array.singleton_methods
p String.singleton_methods
p IO.singleton_methods
p BasicObject.singleton_methods
p BasicObject.methods
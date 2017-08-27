class MyClass
  @@x = " x"
  
  def initialize(s)
    @mystr = s
  end
  
  def get_binding
    binding
  end
end

class MyOtherClass
  @@x = " y"
  
  def initialize(s)
    @mystr = s
  end
  
  def get_binding
    binding
  end
end

@mystr = self.inspect
# @@x = " some other value" # => uncomment to check it 

ob1 = MyClass.new("ob1 string")
ob2 = MyClass.new("ob2 string")
ob3 = MyOtherClass.new("ob3 string")

p @mystr
puts eval("@mystr << @@x", ob1.get_binding)
puts eval("@mystr << @@x", ob2.get_binding)
puts eval("@mystr << @@x", ob3.get_binding)
puts eval("@mystr << @@x", binding)



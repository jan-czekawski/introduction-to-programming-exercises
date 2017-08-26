class MyClass
  def initialize
    @var = "Hello world"
  end

ob = MyClass.new
p ob.instance_eval { @var }
p ob.instance_eval("@var") 

# p ob.instance_eval(@var) # => error
# p ob.eval("@var") # => eval is private (can't have any receivers), instance_eval is public

public :eval

p ob.eval("@var")

end

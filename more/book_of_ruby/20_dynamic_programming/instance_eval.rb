class MyClass
  def initialize
    @var = "Hello world"
  end

ob = MyClass.new
p ob.instance_eval { @var }
p ob.instance_eval("@var") 

p @var
# p ob.instance_eval(@var) # => error, because @var in "main" is nil
@var = "100"
p ob.instance_eval(@var) # => ok
# p ob.eval("@var") # => eval is private (can't have any receivers), instance_eval is public

public :eval

p ob.eval("@var")

end

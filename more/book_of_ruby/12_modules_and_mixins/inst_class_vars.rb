module X
  @instvar = "X's @instvar"
  
  def self.aaa
    puts @instvar
  end
end

X.aaa

module X
  @instvar = "X's @instvar"
  @another_instvar = "X's 2nd @instvar"
  
  def meth
    @instvar = 10   # create instvar in current scope
    puts @instvar
  end
end

include X
p @instvar # => not declared yet in current scope => nil
meth
p @instvar
@instvar = "hello world"
p @instvar
X.aaa
p @instvar


module X
  @@classvar = "X's @@classvar"
end

# include X # => no need

p @@classvar
@@classvar = "bye bye"
p @@classvar

p X.instance_variables
p self.instance_variables
class X
end

ob = X.new
ob.instance_variable_set(:@home, "Burt")

p ob

ob.instance_variable_set("@cherry", Float::INFINITY)
p ob

p ob.instance_variable_get(:@cherry)
p ob.instance_variable_get(:@cherry) - 99999999999999
p ob.instance_variable_get(:@cherry) - Float::INFINITY


class Object
  def add_method(m, &block)
    self.class.send(:define_method, m, &block)
  end
end

ob.add_method(:boom) { |a| puts "'#{a}' times 10 is #{a * 10}" }

ob.boom(4)
ob.boom(90)
ob.boom("check")

ob2 = X.new
ob2.boom(111)
p X.instance_methods.grep(/boom/)

ob2.instance_variable_set("@name", "Mary")
p ob2

a = ob2.instance_variable_get(:@name)
p a

X::const_set(:HOME, "busta rhymes")
p X::const_get("HOME")
p X::HOME

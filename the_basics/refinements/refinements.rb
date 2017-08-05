class C
  def foo
    puts "C#foo"
  end
end

module M
  refine C do
    def foo
      puts "C#foo in M"
    end
  end
end

obj = C.new
obj.foo # => before refinement

using M # => activate refinement
obj.foo # => after

class D
end

module N
  refine D do
    def foo
      puts "C#foo in N"
    end
  end
end

def call_foo(x)
  x.foo
end

d = D.new
# d.foo # => error before refinement activation
using N
d.foo # => after activation

begin
  call_foo(d) # left current scope = refinement deactivated => entered .call_foo method scope
rescue => e
  puts e
end

begin
  d.foo # => refinement still active => still in the same scope
rescue => e
  puts e
else
  puts "It's all good!"
end

# if method defined in the same scope as active refinement => it's good
module N
  def self.home(a)
    a.foo
  end
end

N.home(d) 
d.foo

# check multifile example

# "using" is a method
class Y
end

module X
  refine Y do
    def foo
      puts "Y#foo in X"
    end
  end
end



# activated in a file

# not active here
using X
# active
class Foo
  # active
  def foo
    # active
  end
  # active
end
# active


# activated in a class

# not active
class Foo
  # not actve
  def foo
    # not active
  end
  # not active
  using X
  # active
  def bar
    # active
  end
  # active
end
# not active


# in eval

# not active
eval <<EOF
  # not active
  using X
  Y.new.foo
  # active
EOF
# not active
# Y.new.foo # => here is actually active, because it was activated in top level earlier


# when not evaluated

# not active
if false
  using x
end
# not active



module ToJSON
  refine Integer do
    def to_json
      to_s
    end
  end
  
  refine Array do
    def to_json
      "[" + map { |i| i.to_json }.join(",") + "]"
    end
  end
  
  refine Hash do
    def to_json
      "{" + map { |k, v| k.to_s.dump + ":" + v.to_json }.join(",") + "}"
    end
  end
end

using ToJSON

p [{1 => 2}, {3 => 4}].to_json


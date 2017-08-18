# modules
module MyModule
  # ...
end

module MyModule
  def my_method
    puts "it's working!"
  end
end

module MyModule
  alias my_alias my_method
end

module MyModule
  remove_method :my_method
end

# nesting
module Outer
  module Inner
  end
end

module Outer::Inner::Grandchild
end

# module Main::Outer::Child # => NameError => Main not defined
# end

# scope

# self
p "self outside anything: #{self}"
module MyModule
  p "self in a module: #{self}"
end

def my_method()
  p "self inside of the method: #{self}"
  [1, 2, 3].each do
    p "self inside of the block, inside of method: #{self}"
  end
end

my_method

[1, 2].each do
  p "self inside of the block: #{self}"
end

module Outer::Inner::Grandchild
  p "self in module: #{self}"
  
  def second_method
    p "self in a method in a module: #{self}"
  end
end

# second_method # => nameError
include Outer::Inner::Grandchild
second_method

# constants
module A
  Z = 1
  
  module B
    p Module.nesting
    p Z
  end
end

module C
  Z = 1
end

module C::D
  p Module.nesting
  # p Z  => NameError
  p C::Z  
end

Z = "outside Z"

module E
  Z = "inside Z"
  
  module F
    p ::Z
    p Z
  end
end

# methods

module Grandchild
  p "self in module: #{self}"
  
  def self.third_method
    p "self in a method in a module: #{self}"
  end
end

# third_method # => NameError
Grandchild.third_method

p self.class.ancestors

module G
  L = "big L"
  def l
    "#{L} inside of instance method l"
  end
  
  def self.m
    "#{L} inside of class method m"
  end
end

p G.m
# p G.l # => error

include G
p l
p G.l
# p m # => error
p G.m

p self.class.ancestors

# visibility
class H
  def n(other)
    other.m
  end
end

class I < H
  def m
    1
  end
  
  protected :m
end

class J < I
end

class K < J
end

h = H.new
i = I.new
j = J.new
k = K.new

p j.n(i) # => J is subclass of I
p k.n(i) # => K is sub-subclass of I
p k.n(j) # => K and J are subclasses of I
p i.n(j) # => J is subclass of I, I is defining class
p i.n(i) # => m called on defining class (I)
# p h.n(i)  # => error H is NOT subclass of I

class Oompa
  def home
    "oompa home"
  end
end

p Oompa.new.home

class Loompa < Oompa
  def lost
    # self.second # => error, can't be called with ANY receiver (self included)
    second
  end
  
  private
  
  def second
    "loompa home"
  end
end

# p Loompa.new.second # => error, Loompa.new is a receiver
p Loompa.new.lost # => OK, because .lost is a public method, which calls private method .second

# classes
class MyClass
  
end

class MySubclass < MyClass

end

# inheritance
class AA
  Z = "Z"
  
  def z
    Z
  end
end

class BB < AA
end

p BB.new.z

class AA
  C = "C"
end

class BB < AA
  def c
    C
  end
end

p BB.new.c
# p AA.new.c # => NoMethodError

class AA
  def x
    # "AA"
    11
  end
end

class BB < AA
  def x
    # "BB"
    # super + "BB"
    # super.to_s + "BB"
    "BB"
  end
end

p BB.new.x

class CC
  def ten
    10
  end
end

class DD < CC
  def ten
    super + 20 # => args from subclass
    # super() + 20 # => uses no args
  end
end

p CC.new.ten
p DD.new.ten


class CC
  def ten(x)
    x * 10
  end
end

class DD < CC
  def ten(x)
    # x + super # => uses arguments from subclass
    # x + super() # error in this case => uses no arguments
    x + super(100) # => uses specified arguments
  end
end

p CC.new.ten(3)
p DD.new.ten(5)

# singleton classes
class OO
end

class << OO
  # self is a singleton class here
  p "self inside of singleton class #{self}"
end

class PP
  class << self
    # no need to use self here
    p "self inside of self inside of singleton class #{self}"
  end
end


# since you can open the singleton class of any object this means
# that this code block
o = Object.new

def o.my_method
  1 + 1
end

r = Object.new
class << r
  def my_method
    1 + 1
  end
end

p o, r
p o.my_method, r.my_method

class ZZZ
end

class << ZZZ
  def home
    "et wan't go home"
  end
end

p ZZZ.home
p ZZZ.methods.grep(/home/)

class XXX < ZZZ
end

p XXX.home
p XXX.methods.grep(/home/)

class << ZZZ
  alias :boy :home
end

p ZZZ.boy
p XXX.boy

p "UNDEFINE"

class << ZZZ
  undef :home
end

# class AAAA
#   def self.check
#     "check please"
#   end
# end

# class BBBB < AAAA
# end

# p AAAA.check
# p BBBB.check

# class AAAA
#   remove_method :check
# end

p ZZZ.boy
p XXX.boy
# p ZZZ.home
# p XXX.home

class << ZZZ
  alias :girl :boy
end

p ZZZ.girl
p XXX.girl

class << ZZZ
  remove_method :boy
end

p ZZZ.girl
# p ZZZ.boy
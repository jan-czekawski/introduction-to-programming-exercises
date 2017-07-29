def one_plus_one
  1 + 1
end

p one_plus_one

def method_name
  puts "It prints the info from the method"
end

method_name

def hello
  "hello"
end

p hello


# unary methods
class C
  def -@
    puts "you inverted this object"
  end
end

obj = C.new
-obj

class C
  def [](a, b)
    puts a + b
  end
  
  def []=(a, b, c)
    puts a * b + c
  end
end

obj = C.new
obj[11, 200]
obj[2, 3]= 900
obj[2, 3] = 900


res1 = obj[11, 200]
res2 = obj[2, 3]= 900
res3 = obj[2, 3] = 900

p res1, res2, res3

class D
  def []=(a, b)
    return a = 100
  end
end

d = D.new
p d[10]=2
p d

class E
  def [](*a)
    puts "hello is it me you're looking for?"
    a
  end
  
  def []=(a, b)
    a = 2 * a
    b = 2 * b
  end
end

e = E.new
e[]
r = e[100, 200, 300]
p r

x, y = 11, 33
ee = E.new
r = e[x]=y
p r
p x, y
p "#" * 100

# return values
def one_plus_one
  return 1 + 1
end

p one_plus_one

def two_plus_one
  return 2 + 1
  1 + 1
end

p two_plus_one

def a=(value)
  return value * 10
end

p a=(11)

# scope

def my_method
  # scop
end

class A
  # instance method => accessed by instance of the class => objects
  def my_method
    puts "change"
  end
  
  # class method => accessed by class, its subclasses
  def self.second_method
    puts "home"
  end
end

class AA < A
end

a = A.new
p a

a.my_method
# a.second_method  # => error, second method is class method
A.second_method


aa = AA.new
aa.my_method
# aa.second_method  # => error
AA.second_method

# adding method to an object
greeting = "Hello"

def greeting.broaden
  self + ", world!"
end

p greeting
p greeting.broaden

# p "boss".broaden # => other strings can't use that method
# p String.broaden # => nor String class

def String.mate
  "Oy mate!"
end

# p mate # => error, cause that method is on String class
# p "string".mate # => error, cause it's an instance of a class String
p String.mate

# overriding
p "42".to_i

# class String
#   def to_i
#     100
#   end
# end

# p "42".to_i
# p "home".to_i

# arguments
def add_one(value)
  value + 1
end

p add_one(100)

def add_one value
  value + 1
end

p add_one(100)

def add_args(a, b)
  a + b
end

p add_args(11, 200)

p "#" * 100

# default values
def add_values(a, b = 1)
  a + b
end

p add_values(10, 20)
p add_values(10)

def add_values(a = 2, b = 7, c)
  a + b + c
end

p add_values(10)
p add_values(10, 2)
p add_values(10, 2, 20)

# def add_values(a = 2, b, c = 23) # => syntax error
#   a + b + c
# end

p add_values(1)

# array decomposition
# def my_method(a, b) # => ArgError w/o (1 arg)
def my_method((a, b))
  # a: a, b: b # => error
  # [a: a, b: b] # => ok
  p a: a, b: b # => ok
end

my_method(["hope", "man"])
# my_method(["hope", "man"], "check") # => ArgError (2 args)
my_method("string")
my_method("string".split(""))


def my_method((a, b))
  p a: a, b: b
end

my_method([1, 2, 3])

def my_method((a, *b))
  p a: a, b: b
end

my_method([1, 2, 3, 4])

def my_method(a, (b, c), d)
  p a: a, b: b, c: c, d: d
end

my_method(11, [22, 33], 34)
my_method(11, [22, 33, 100, 200], 34)
my_method(11, [22], 34) # => c is nil in this case
my_method(11, 22, 34)
my_method(11, "ehllo", 34)
my_method(11, { h: 10 }, 34)

p "splat"

def my_method(a, (b, *c), d)
  p a: a, b: b, c: c, d: d
end

my_method(11, [22, 33], 34)
my_method(11, [22, 33, 100, 200], 34)
my_method(11, [22], 34) # => c is empty array in this case

def my_method(((a, b), c))
  p a: a, b: b, c: c
end

# my_method(10, 20, 30) => error
my_method([10, 20, 30])
my_method([[100, 200], 20, 30])
my_method([[100, 200, 300], 20, 30])
my_method([[100, 200, 300]])
my_method("home")

p "array/hash"
# array/hash argument

def gather_arg(*arg)
  p arg: arg
end

gather_arg(1, 2, 3)
gather_arg(1, 2, c: 3)
gather_arg(1, 2, :c => 3)
gather_arg(1, 2, :c => 3, d: 10)
gather_arg(1, 2, :c => 3, d: 10, :e => 100) # => all into the same hash
# gather_arg(1, 2, :c => 3, d: 10, :e => 100, "hello") # => error

def gather_arg(*arg, key: "default")
  p arg: arg, key: key
end

gather_arg(10, 20, 30, key: 2)
# gather_arg(10, 20, 30, key: 2, 20) # => error
gather_arg(10, 20, 30)
gather_arg(10, 20, 30, key: 200)

# gather_arg(10, 20, 30, key: 2, 20) # => error


# to ignore arguments
def ignore(*)
  10 + 20 + 30
end

p ignore(100, 20, 300)
p ignore(100)
p ignore(["hope"])

# keyword arguments
def add_value(first: 1, second: 2)
  first + second
end

def gather_args(first: nil, **rest)
  p first, rest
end

gather_args(first: 1, second: 2, third: 3, fourth: 4)

# blocks
def my_method(&my_block)
  my_block.call(self)
end
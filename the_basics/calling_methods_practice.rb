def my_method(*arg)
  p "home"
end

my_method

my_method(1, "two", :three)

my_method("a", "b", c: 100, :d => 200, e: 1000)

my_method "boss", "cause", "loss"

def second_method(*coss)
  p "second"
end

# my_method "boss", "cause", "loss", second_method "just", "last" 
# my_method("boss", "cause", "loss") second_method("just", "last")
# ERRORS

def new_method(a, b, *c)
  p a, b, c
end
# no splat on c => error
new_method(100, 11, 1000, 2000, 3000)

# argument c would take last integer into array and single hash of all keywords/hash args
new_method(11, 222, 333, z: 100, d: 200, x: 2000, y: 10000, :aa => "boss")


def new_method(a, b, c, d)
  p a, b, c, d
end
# last argument "takes" keyword/hash args as single hash
new_method(11, 222, 333, z: 100, d: 200, x: 2000, y: 10000, :aa => "boss")


# default arguments
def my_method(a, b, c = 3, d = 4)
  p [a, b, c, d]
end

my_method(1, 2)
my_method(1, 2, 5)

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(1, 4)
my_method(1, 5, 6)

def my_method(a, b = 2, c = 3, d, e, f)
  p [a, b, c, d, e, f]
end

my_method(1, 4, 5, 6, 7)

# keyword args
def my_key(h: 100, c: 2000)
  p [h, c]
end

# no args given => default values
my_key()

my_key(h: 200, c: 1000)
# my_key(200, 1000) # => arg error
def my_key(h, i)
  p [h, i]
end

# my_key(h: 999, i: 1000) => arg error

def first_method(*arg)
  p "first start"
  yield
  p "first end"
end

def second_method(*arg)
  p "second start"
  yield
  p "second end"
end

# { ... } has bigger precedence than do ... end

# first_method second_method {    # => error => no block for first_method
#   p "home"
# }
first_method second_method { p "home from second" } do
  p "2nd home"
end

p "#" * 100

# can pass args to a block into | | and by using yield
def my_meth2(*args)
  p "begin boss"
  yield(args)
  p "end boss"
end

my_meth2(200, 1000) do |x, y|
  p x + 1, y + 1
end

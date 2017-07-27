# http://blog.honeybadger.io/ruby-splat-array-manipulation-destructuring/


def go(x, *args)
  # puts args.inspect
  p args
end

go("a", "b", "c")

# def go(params) #=> would accept hashes and other types; wouldn't accept w/o any argument
def go(**params) # => would accept ONLY hashes, would accept w/o any argument
  p params
  # puts params.inspect
end

go(x: 100, y: 200, z: 1000)
# go(["boss"])
# go("boss")
# go()



# to use array to pass multiple args
def go(x, y)
  p x, y
end

point = [10, 20]
go(*point)

# ** to pass multiple args with keywords
def go(x:, y:)
  p x, y
end

point = { x: 30, y: 200 }
# point = {}

# go(point)
go(**point)

puts "#" * 100
# * doesn't have to be at the end of args in method
def go(x, *args, y)
  puts x
  puts y
  puts args.inspect
end

go(1, 2, 3, 4, 5)

# array breaking down
a, b = [1, 2]
puts a, b

# pop first arg without changing array
first, *remainder = [1, 2, 3, 4, 5]
p first, remainder

first, * = [1, 2, 3, 4, 5]
p first

# take last element
*previous, last = [1, 2, 3, 4, 5]
p previous, last

*, last = [1, 2, 3, 4, 5]
p last

# take first and last
first, *medium, last = [1, 2, 3, 4, 5]
p first, medium, last

first, *, last = [1, 2, 3, 4, 5]
p first, last


# can be used for constructing arrays
p [*[1, 2], *[5, 7]]

puts "#" * 100
# * can smartly coerce objects to array
x = *"bob"
p x
# BUT p x = *"bob" => SYNTAX ERROR
# p x = *"bob"

# unless they're nil => rets empty array
x = *nil
p x
# p x = *nil => syntax error

# arrays are passed unchaged
x = *[1, 2, 4]
p x

# hashes are conv to arr
x = *{h: 10, t: 11}
p x



puts "#" * 100

# let's say you want to create array of strings
# first you'd check if array exists and initialize it if not
# second if someone tries to add array of string (not string) as element, you'd
# want to respond smartly

# * helps us with that


# your config hash, may or may not have an array :ignore
config = {  }

# callback function might return array, or might return single item (string)


def add_ignores
  # "scoundrels" 
  ["scoundrels", "foxes", "bosses"] # => could also be array 
end

# def add_ignores(*args)
#   args
# end


# no matter what you start with, you get an array of things to ignore
config[:ignore] = [*config[:ignore], *add_ignores]

p config

# https://blog.simplificator.com/2015/03/20/ruby-and-the-double-splat-operator/

# variable length argument
def single_splat(argument, *rest)
  puts "#{rest.size} additional argument(s)"
end

single_splat("howdy")
single_splat("howdy", :foo)
single_splat("howdy", :foo, :bar, :baz)

# unpack values from array
def unwrapped(a, b, c)
  puts "#{a} / #{b} / #{c}"
end

data = [1, 2, 3]

unwrapped(*data)
# unwrapped(data) => argument error



# coerce values to arrays
coerced = *"Hello World"
p coerced

coerced = *nil
p coerced

coerced = *[1, 2, 3]
p coerced

coerced = *{h: 10, i: 20}
p coerced


# to deconstruct arrays
data = [1, 2, 3, 4]

first, *rest = data
puts "#{first}, #{rest}"

*list, last = data
puts "#{list}, #{last}"

first, *center, last = data
puts "#{first}, #{center}, #{last}"

first, second, *center, third, fourth = data
puts "#{first}, #{second}, #{center}, #{third}, #{fourth}"

# double splat (since ruby 2.0) behaves similarly for hashes in arg list
def double_splat(**hash)
  p hash
end

double_splat()
# double_splat(nil) # => arg error
double_splat(a: 1)
double_splat(a: 1, b: 2)
# double_splat('a non hash argument') => arg error

# ** vs standard arg
def standard_argument(hash = {})
  puts hash
end

standard_argument()
standard_argument(nil) # => rets no hash => nil



# common in rails
def extracted_options(*names, **options)
  puts "#{names} / #{options}"
end

extracted_options()
extracted_options('pascal', 'lukas', color: '#123456', offset: 3, other_option: :foo)
extracted_options("Patrick", "Michal", "John", h: 10, i: 20, j: 30)
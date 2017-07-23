# http://blog.honeybadger.io/ruby-splat-array-manipulation-destructuring/


def go(x, *args)
  # puts args.inspect
  p args
end

go("a", "b", "c")

def go(**params)
  p params
  puts params.inspect
end

go(x: 100, y: 200)

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

go(point)
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
# def add_ignores(*args)
  "scoundrels" # => could also be array like ["scoundrels", "foxes", "bosses"]
  # args
end

# def add_ignores(*args)
#   args
# end


# no matter what you start with, you get an array of things to ignore
config[:ignore] = [*config[:ignore], *add_ignores]

p config
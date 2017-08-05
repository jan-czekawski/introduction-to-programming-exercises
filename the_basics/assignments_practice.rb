p local_variables

1.times do
  a = 1
  puts "local variables in the block: #{local_variables}"
end

puts "no local variables outside of the block" if local_variables.empty?

a = 0
1.times do
  puts "local_variables in the block: #{local_variables}"
  1.times do
    b = 11
    puts "local_variables in the block: #{local_variables}"
  end
end


# p aa # => error
aa = 10 if false
p aa # => nil
aa = 10
p aa

p "#" * 100

def big_calculation
  42
end

big_calculation = big_calculation
p big_calculation

big_calculation = big_calculation()
p big_calculation

big_calculation = 11
p big_calculation

l = big_calculation()
p l

p bb = 0.zero?

# wrong order
# p cc if cc = 0.zero? # => error cause ruby thinks cc is a method
if cc = 0.zero?
  p cc
end

# local var name cannot have "-"
# p z-zz = 10

# instance var
class C
  def initialize(value)
    @instance_var = value
  end
  
  def value
    @instance_var
  end
end

obj1 = C.new("boss")
obj2 = C.new("nass")

p obj1.value
p obj2.value
p @instance, @boss
@instance = 11
p @instance

class A
  @@class_var = 0
  
  def value
    @@class_var
  end
  
  def update
    @@class_var += 1
  end
end

class B < A
  def update
    @@class_var += 2
  end
end

a = A.new
b = B.new

p "a value is #{a.value}"
p "b value is #{b.value}"

p "update A"
a.update

p "a value is #{a.value}"
p "b value is #{b.value}"

p "update B"
b.update

p "a value is #{a.value}"
p "b value is #{b.value}"

p "update A"
a.update

p "a value is #{a.value}"
p "b value is #{b.value}"

# @@check = 100 # => warning
# p @@check # => warning
# p @@boss # => error

p "#" * 100

# global vars
$global = 0

class D
  puts "in a class #{$global}"
  
  def my_method
    puts "in a method #{$global}"
    $global += 1
    $other_global = 3
  end
end

D.new.my_method
puts "at the top level, $global: #{$global}, $other_global: #{$other_global}"


# CAN ONLY CHANGE @VALUE => CAN'T 'READ' IT
class D
  def value=(value)
    @value = value
  end
end



dd = D.new
dd.value = "boss"
p dd

# same as above
class E
  # attr_accessor :value
  attr_writer :value
end

ee = E.new
ee.value = "nass"
p ee


# You must always have a receiver (instance var) => otherwise ruby'll think 
# you want to assign local var
class F
  # attr_reader :value # => only method .value works
  # attr_writer :value # => only .value=
  attr_accessor :value # => both
  
  def my_method
    # value = 42
    self.value = 42
    
    puts "local variables: #{local_variables}"
    puts "@value: #{@value.inspect}"
  end
end

ff = F.new
ff.my_method
p ff.value

p "#" * 100

# abbreviation assignments
ab = 1
ab += 1
p ab

ac &&= 100
p ac
ac ||= 100
p ac


# implicit array assignment
ad = 1, 2, 3
ae = *[1, 2, 3]
af = 1, *[2, 3]

p ad, ae, af

ag, ah = 1, 2
p ag: ag, ah: ah

# accessing objects instant var via special method
p ff.instance_variable_get(:@value)

# multiple assignment with assignment methods
def value=(value)
  p assigned: value
end

self.value, $global = 1, 2
p $global


# can use multiple assignment to swap values
old_value = 1
new_value, old_value = old_value, 2

p new_value: new_value, old_value: old_value

za, zb = 1, 2, 3
p za: za, zb: zb

zc, *zd = 1, 2, 3
p zc: zc, zd: zd


# array decomposition
(a, b) = [1, 2]
# a, b = [1, 2] # => it's the same actually
p a: a, b: b

a, (b, c) = 1, [2, 3]
# a, b, c = 1, [2, 3] # => c = nil
p a: a, b: b, c: c

a, (b, *c), *d = 1, [2, 3, 4], 5, 6 # => each decomposition is assignment => more splats
# # a, b, *c, *d = 1, [2, 3, 4], 5, 6 # => error => 2 splats!! in 1 assignment
p a: a, b: b, c: c, d: d


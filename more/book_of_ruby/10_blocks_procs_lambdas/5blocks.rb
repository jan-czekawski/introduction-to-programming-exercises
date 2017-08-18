def abc(a, b, c)
  a.call
  b.call
  c.call
  yield
end

x = lambda { puts "one" }
y = lambda { puts "two" }
z = proc { puts "three" }

abc(x, y, z) { puts "four" }

def abc2(&d)
  d.call
end

abc2 { puts "FREEEDOOOM" }
abc2(&x)
abc2(&y)


def abc3(a, b, c, &d)
  a.call
  b.call
  c.call
  d.call
  yield
end
p "NEXT"
abc3(x, y, z) { puts "five" }

my_proc = proc { puts "my proc" }
abc3(x, y, z, &my_proc)


p "NEXT"

def xyz
  x = 1
  y = 2
  z = 3
  yield(x, y, z)
end

xyz { |a, b, c| puts a + b + c }
xyz(&my_proc)

p "Lambda"

lam = lambda { puts "my_proc"}
# xyz(&lam) # => ArgumentError
lam = ->(aa, bb, cc) { puts "my_proc"}
xyz(&lam)

p "NEXT"

a = lambda { puts "one" }
b = lambda { puts "two" }
c = proc { puts "three" }


xyz { |a, b, c| puts a + b + c }
puts a, b, c # => in 1.8 they'd be integers 1, 2, 3


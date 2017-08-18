x = 3000

c1 = proc { x + 100 }

some_val = 1000

some_val = c1.call(some_val)
p some_val

some_val = c1.call(some_val)
p some_val

# 2.times do 
#   some_val = c1.call(some_val)
#   p some_val
# end

c2 = proc { |z| z + 100 }
some_val = 1000

some_val = c2.call(some_val)
p some_val

some_val = c2.call(some_val)
p some_val

c3 = proc { |x| x + 100 }

some_val = c3.call(some_val)
p some_val

some_val = c3.call(some_val)
p some_val

p x # => changed in 1.8

p "x=[#{defined?(x)}], z=[#{defined?(z)}]"


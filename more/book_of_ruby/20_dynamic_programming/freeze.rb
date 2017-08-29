s = "Hello"
s << " world"
s.freeze
# s << " !!!" error

a = [1, 2, 3]
a.freeze

if !(a.frozen?)
  a << [4, 5, 6]
end

p a


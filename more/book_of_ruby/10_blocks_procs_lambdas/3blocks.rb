a = Proc.new { |x| x = x * 10; puts x }

a.call(100)
a.call(100, 200, 300)

b = lambda { |x| x = x * 10; puts x }
b.call(200)
# b.call(200, 300, 400) # => arg error

c = proc { |x| x.capitalize! }

c1 = c.call("hello")
p c1

c1 = c.call("hello", "check", "home")
p c1


# d = lambda { |x| x.capitalize! }
d = ->(x){ x.capitalize! }
d1 = ["hello", "good day", "how do you do"].each { |s| d.call(s) }
puts d1.inspect
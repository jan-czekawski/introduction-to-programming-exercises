a = "hello world"

def foo
  yield 100
end

puts a              # => hello world
foo { |a| puts a }  # => 100
puts a              # => 100/hello world  1.8/1.9


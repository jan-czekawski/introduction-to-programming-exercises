# since RUBY 2.0
def foo(bar: "default")
  puts bar
end

foo
foo(bar: "baz")
# foo("boss") => error
foo(bar: "boss")

# same in Ruby 1.9
def foo(options = {})
  bar = options.fetch(:bar, "default")
  puts bar
end

foo
foo(bar: "baz")

# in Ruby 2.0 also blocks can be defined using that syntax
define_method(:foo) do |bar: "default"|
  puts bar
end

foo
# foo("boss")
foo(bar: "boss")


# in Ruby 2.1 => required keywords
def foo(bar:)
  puts bar
end

# foo => arg error
foo(bar: "nass")

puts "NEXT"
# keyword args vs positional args
def mysterious_total(subtotal, tax, discount)
  p subtotal + tax - discount
end

mysterious_total(100, 10, 5)

def obvious_total(subtotal:, tax:, discount:)
  p subtotal + tax - discount
end

# obvious_total(100, 10, 5) arg error
# ARGS CAN SWAP PLACES => SAME BEHAVIOUR
obvious_total(subtotal: 100, tax: 10, discount: 5)
obvious_total(discount: 5, tax: 10, subtotal: 100)

mysterious_total(5, 10, 100) # => different result

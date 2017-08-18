class Array
  new_meth_code = ->(*args) { puts args.inspect }
  define_method(:new_meth, new_meth_code)
end

class Array
  define_method(:second_meth) do |*args|
    puts args.inspect
  end
end

class Array
  define_method(:third_meth, lambda {
    |*args| puts args.inspect
  })
end

p Array.method_defined?(:new_meth)
p Array.method_defined?(:second_meth)
p Array.method_defined?(:third_meth)

[].new_meth(1, 2, 3)
[].second_meth(1, 2, 3)
[].third_meth(1, 2, 3)
["abba", "boss"].third_meth(1, 2, 3)

class Array
  remove_method(:new_meth)
end


p Array.method_defined?(:new_meth)
p Array.method_defined?(:second_meth)
p Array.method_defined?(:third_meth)

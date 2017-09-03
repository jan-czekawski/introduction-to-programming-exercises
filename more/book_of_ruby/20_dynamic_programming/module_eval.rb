module X
end

class Y
  @@x = 10
  include X
end

X::module_eval do
  define_method(:xyz) do
    puts "hello"
  end
end

Y::class_eval do
  define_method(:abc) do
    puts "hello, hello"
  end
end

Y.new.abc
Y.new.xyz

Y.new::abc
Y.new::xyz

Y::new::abc
Y::new::xyz

X::class_eval do
  define_method(:xyz2) do
    puts "hello again"
  end
end

Y::module_eval do
  define_method(:abc2) do
    puts "hello, hello again"
  end
end

ob = Y.new
ob.abc2
ob.xyz2

ob::abc2
ob::xyz2

String.class_eval do
  define_method(:bye) do
    puts "goodbye"
  end
end

"Hello".bye
# String.bye # error => instance method, not class

check = Y.class_eval("@@x")
p check

new_y = Y.new

Y.class_eval('def hi;puts "hello";end')

new_y.hi
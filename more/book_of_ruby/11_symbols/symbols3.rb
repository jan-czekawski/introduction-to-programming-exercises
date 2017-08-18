def my_meth(some_arg)
  print "I say: " << some_arg
end

this_is_method_name = method(:my_meth)
p this_is_method_name
p this_is_method_name.class

this_is_method_name.call("hello world")

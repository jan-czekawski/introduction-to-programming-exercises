def meth
  yield
end

meth { puts "It's nothing" }

b = proc { puts "It's proc" }

meth(&b)

meth { puts "To the republic. To democracy!!!" }

def second_meth(a, b, c, &d)
  p a: a, b: b, c: c
  yield("geronimo")
end

home = ->(x){ puts "It's lambda", x }
second_meth(10, 20, 30, &home)

home = ->(*){ puts "It's lambda" }
second_meth(10, 20, 30, &home)

p "SOMETHING ELSE"

def caps(arg)
  yield(arg)
end

caps("a lowercase string") do |x|
  x.capitalize!
  puts x
end

# ["hello", "good day", "how do you do"]
%w(hello good\ day how\ do\ you\ do).each do |s|
  caps(s) do |x| 
    x.capitalize!
    puts x
  end
end
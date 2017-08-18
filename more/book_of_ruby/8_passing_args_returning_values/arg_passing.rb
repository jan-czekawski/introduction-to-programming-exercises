def meth(arg)
  puts "#{arg.object_id}\n\n"
end

class MyClass
end

i = 10
f = 10.5
s = "hello world"
ob = MyClass.new

puts "#{i}.object_id = #{i.object_id}"
meth(i)
puts "#{f}.object_id = #{f.object_id}"
meth(f)
puts "#{s}.object_id = #{s.object_id}"
meth(s)
puts "#{ob}.object_id = #{ob.object_id}"
meth(ob)
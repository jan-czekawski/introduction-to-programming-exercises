class X
  def y
    puts "ymethod"
  end
end

p Object::X
p Object::X.class
p Object.const_get("X")
p Object.const_get("X").class
p Object.const_get("X").new
p Object.const_get("X").new.class

print "Enter class name: "
cname = gets.chomp
ob = Object.const_get(cname).new
p ob
print "Enter method to be called: "
mname = gets.chomp
ob.method(mname).call
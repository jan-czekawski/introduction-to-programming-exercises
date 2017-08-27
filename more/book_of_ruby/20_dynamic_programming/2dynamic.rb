class X
  def y
    puts "ymethod"
  end
end

print "Enter class name: "
cname = gets.chomp
ob = Object.const_get(cname).new
p ob
print "Enter method to be called: "
mname = gets.chomp
ob.method(mname).call
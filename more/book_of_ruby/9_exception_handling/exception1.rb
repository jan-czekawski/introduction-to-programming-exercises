begin
  x = 1/0
# rescue 
rescue Exception
  x = 0
  puts $!.class
  puts $!.class.superclass
  puts $!.class.superclass.superclass
  puts $!.class.superclass.superclass.superclass
  puts $!.class.superclass.superclass.superclass.superclass
  puts $!
end

puts x
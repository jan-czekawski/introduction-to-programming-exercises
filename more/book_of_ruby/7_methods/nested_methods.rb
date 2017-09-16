class X
  def outer_x
    print "x:"
    
    def nested_y
      print "ha! "
    end
    
    def nested_z
      print "z:"
      nested_y
    end
    
    nested_y
    nested_z
  end
end

ob = X.new
# ob.nested_y # => error
ob.outer_x # => "top" level method was called, have access to nested methods 
ob.nested_y
ob.nested_z

class X
  def x
    print "x:"
    def y
      print "y:"
    end
    
    def z
      print "z:"
      y
    end
  end
end

puts "\nOTHER METHODS"
ob1 = X.new
# ob1.y => error
ob1.x
puts
ob1.y
puts
ob1.z

def Fred
  "home"
end
puts
p Fred()
class Y
  def some_method
    puts "Y's some_method"
  end
end

class Z < Y
  def some_method
    puts "Z's some_method"
  end
end

zob = Z.new
zob.some_method  # Z's method

class Z
  undef_method(:some_method) # undefine some_method from Z class
end

begin
  zob.some_method # objects of the class Z can't use method from Y class
rescue => e
  p e
end

ob_y = Y.new # objects of the class Y still can use method from Y class
ob_y.some_method
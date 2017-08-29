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
  remove_method(:some_method) # remove some_method from Z class
end

zob.some_method


module A
  def meth_a
    p "hello from a"
  end
  
  # def my_meth
  #   p "hello from a, from my my_meth"
  # end
end

class MyClass
  def my_meth
    p "hello from my_meth of class MyClass"
  end
end

ob = MyClass.new
ob.my_meth
ob.extend(A)
ob.meth_a
ob.my_meth

module B
  def meth_b
    p "hello from b"
  end
end

module C
  def my_meth
    p "hello from my_meth of module C"
  end
end

ob.extend(B, C)
ob.meth_b
ob.my_meth

ob.freeze

module D
  def meth_d
    p "hello from d"
  end
end

# ob.extend(D)

# if !(ob.frozen?)
unless ob.frozen?
  ob.extend(D)
  ob.meth_d
else
  p "Can't extend a frozen object"
end

def one_plus_one
  1 + 1
end

p one_plus_one

def method_name
  puts "It prints the info from the method"
end

method_name

def hello
  "hello"
end

p hello


# unary methods
class C
  def -@
    puts "you inverted this object"
  end
end

obj = C.new
-obj

class C
  def [](a, b)
    puts a + b
  end
  
  def []=(a, b, c)
    puts a * b + c
  end
end

obj = C.new
obj[11, 200]
obj[2, 3]= 900
obj[2, 3] = 900


res1 = obj[11, 200]
res2 = obj[2, 3]= 900
res3 = obj[2, 3] = 900

p res1, res2, res3

class D
  def []=(a, b)
    return a = 100
  end
end

d = D.new
p d[10]=2
p d

class E
  def [](*a)
    puts "hello is it me you're looking for?"
    a
  end
  
  def []=(a, b)
    a = 2 * a
    b = 2 * b
  end
end

e = E.new
e[]
r = e[100, 200, 300]
p r

x, y = 11, 33
ee = E.new
r = e[x]=y
p r
p x, y
p "#" * 100

# return values
def one_plus_one
  return 1 + 1
end

p one_plus_one

def two_plus_one
  return 2 + 1
  1 + 1
end

p two_plus_one

def a=(value)
  return value * 10
end

p a=(11)
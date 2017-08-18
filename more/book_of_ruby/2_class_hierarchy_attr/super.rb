class Thing
  def initialize(aName, aDescription)
    @name = aName
    @description = aDescription
    puts "Thing.initialize: #{self.inspect}\n\n"
  end
  
  def aMethod(aNewName)
    @name = aNewName
    puts "Thing.amethod: #{self.inspect}\n\n"
  end
end

class Thing2 < Thing
  def initialize(aName, aDescription)
    super
    @fulldescription = "This is #{@name}, which is #{@description}"
    puts "Thing2.initialize: #{self.inspect}\n\n"
  end
  
  def aMethod(aNewName, aNewDescription)
    super(aNewName)
    puts "Thing2.aMethod: #{self.inspect}\n\n"
  end
end

class Thing3 < Thing2
  def initialize(aName, aDescription, aValue)
    super(aName, aDescription)
    @value = aValue
    puts "Thing3.initialize: #{self.inspect}\n\n"
  end
  
  def aMethod(aNewName, aNewDescription, aNewValue)
    super(aNewName, aNewDescription)
    @value = aNewValue
    puts "Thing3.aMethod: #{self.inspect}\n\n"
  end
end

class Thing4 < Thing3
  def aMethod
    puts "Thing4.aMethod: #{self.inspect}\n\n"
  end
end

class Thing5 < Thing4
end


def test1
  puts "#" * 50, "TEST 1", "#" * 50
  t = Thing.new("A Thing", "a lovely thing full of thingness")
  t.aMethod("A New Thing")
end

def test2
  puts "#" * 50, "TEST 2", "#" * 50
  t2 = Thing2.new("A Thing2", "a Thing2 thing full of beauty")
  t2.aMethod("A New Thing2", "a new Thing2 description")
end

def test3
  puts "#" * 50, "TEST 3", "#" * 50
  t3 = Thing3.new("A Thing3", "a Thing3 full of Thing and Thing2iness", 500)
  t3.aMethod("A New Thing3", "and a new Thing3 description", 1000)
end

def test4
  puts "#" * 50, "TEST 4", "#" * 50
  t4 = Thing4.new("A Thing4", "the nicest Thing4 you will ever see", 10)
  t4.aMethod
end

def test5
  puts "#" * 50, "TEST 5", "#" * 50
  t5 = Thing5.new("A Thing5", "a very simple Thing5", 40)
  t5.aMethod
end

# main loop
ans = ""
puts "Run Test 1, 2, 3, 4, 5?\nWrite a number or 'q' to quit. Then press [Enter] key\n\n"
until ans == 'q' do
  puts "[ Enter 1, 2, 3, 4, 5 or 'q'? ]"
  print "> "
  ans = gets[0].chr.downcase
  case ans
  when "1" then test1
  when "2" then test2
  when "3" then test3
  when "4" then test4
  when "5" then test5
  end
end
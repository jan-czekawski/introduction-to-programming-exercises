class A
  def initialize(string, number)
    @string = string
    @number = number
  end
  
  def to_s
    "In A:\n    #{@string}, #{@number}\n"
  end
end

class B
  def initialize(number, a_object)
    @number = number
    @a_object = a_object
  end
  
  def to_s
    "In B: #{@number} \n #{@a_object}\n"
  end
end

class C
  def initialize(b_object, a_object)
    @b_object = b_object
    @a_object = a_object
  end
  
  def to_s
    "In C:\n #{@a_object} #{@b_object}\n"
  end
end

a = A.new("hello world", 5)
b = B.new(7, a)
c = C.new(b, a)


serial_object = Marshal::dump(c)
puts Marshal::load(serial_object)

# serialized_object = YAML::dump(c)
# # puts serialized_object
# puts YAML::load(serialized_object)

File.open("marshal_print.dat", "w") do |file|
  (1..10).each do |index|
    file.print Marshal::dump(A.new("hello world", index))
  end
end

array = []
    # $/=     is an input record separator
$/="\n"
File.open("marshal_puts.dat", "r").each do |obj|
  array << Marshal::load(obj)
end

puts array



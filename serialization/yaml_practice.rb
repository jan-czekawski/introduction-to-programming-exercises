require "yaml"

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

p c
puts c

serialized_object = YAML::dump(c)
# puts serialized_object
puts YAML::load(serialized_object)

File.open("blah_no_space.yaml", "w") do |file|
  (1..10).each do |index|
    file.puts YAML::dump(A.new("hello world", index))
  end
end

array = []
#     $/=     is an input record separator
$/="\n\n"
File.open("blah.yaml", "r").each do |obj|
  array << YAML::load(obj)
end

puts array




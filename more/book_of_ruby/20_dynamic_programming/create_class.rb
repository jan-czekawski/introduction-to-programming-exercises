print "What shall we call this class? "
class_name = gets.strip.capitalize
p "class name after input"
p class_name

Object.const_set(class_name, Class.new)
p "class name after const set"
p class_name

class_name = Object.const_get(class_name)
p "class name assigned value of Object.const_get(class_name)"
p class_name

puts "I'll give it a method called 'myname'"
class_name::module_eval do
  define_method(:myname) do
    puts "The name of my class is '#{self.class}'"
  end
end
p "class name instance_methods"
p class_name.instance_methods

x = class_name.new
x.myname
p x


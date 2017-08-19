require "yaml"

class Yclass
  def initialize(num, str, arr)
    @num = num
    @str = str
    @arr = arr
  end
  
  def to_yaml_properties
    ["@num", "@arr"]
  end
end

ob1 = Yclass.new(10, "home", ["check", "it"])
p ob1

puts ob1.to_yaml

p "ANOTHER OBJECT"
ob = Yclass.new(100, "fred", [1, 2, 3])
p ob

yaml_ob = YAML.dump(ob)
puts yaml_ob

ret_ob = YAML.load(yaml_ob)
p ret_ob


require "yaml"

class Home
  attr_accessor :name, :address
  
  def initialize(name, address)
    @name = name
    @address = address
  end
  
  def self.paint
    puts "There are many colors to choose from."
  end
  
  def show_me
    # puts "#{self} has a name: #{@name} and address: #{@address}."
    puts "#{self} has a name: #{name} and address: #{address}."
    # puts "#{self} has a name: #{self.name} and address: #{self.address}."
  end
end

ob = Home.new("Hogwarts", "Main Street 11")
p ob
ob.show_me
Home.paint

File.open("test_yaml_save_obj.yml", "w") do |f|
  YAML.dump(ob, f)
end

File.open("test_yaml_save_class.yml", "w") do |f|
  YAML.dump(Home, f)
end
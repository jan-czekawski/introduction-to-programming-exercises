# http://rubylearning.com/blog/2010/11/23/dont-know-metaprogramming-in-ruby/

# http://ruby-metaprogramming.rubylearning.com/


# adding method in context of an object

# new instance of Object
my_object = Object.new

# define method on that obj to set the instance var
def my_object.set_my_variable=(var)
  @my_instance_variable = var
end

# def method on obj to return value of inst var
def my_object.get_my_variable
  @my_instance_variable
end

my_object.set_my_variable = "Hope"
p my_object.get_my_variable

my_other_object = Object.new
# my_other_object.set_my_variable = "Home"  # => error
# p my_other_object.get_my_variable         # => error


# adding method to an object (class is an object)
class MyClass
  def self.capitalize_name
    name.upcase
  end
end

p MyClass.capitalize_name

# same thing different syntaxes

# def class meth within class definition
class MyClass
  def MyClass.capitalize_name
    name.upcase
  end
end

# define class method outside of the class def
class MyClass
end

def MyClass.capitalize_name
  name.upcae
end


# define new class
MyClass2 = Class.new

def MyClass2.capitalize_name
  name.upcase
end



# WRITING CODES THAT WRITES CODE

# application to store and access car's data on models

class CarModel
  def engine_info=(info)
    @engine_info = info
  end
  
  def engine_info
    @engine_info
  end
  
  def engine_price=(price)
    @engine_price = price
  end
  
  def engine_price
    @engine_price
  end
  
  # etc
end


# can simplify it
class CarModel
  FEATURES = ["engine", "wheel", "airbag", "alarm", "stereo"]  

  FEATURES.each do |feature|
    define_method("#{feature}_info=") do |info|
      instance_variable_set("@#{feature}_info", info)
    end
    
    define_method("#{feature}_info") do
      instance_variable_get("@#{feature}_info")
    end
    
    define_method("#{feature}_price=") do |price|
      instance_variable_set("@#{feature}_price", price)
    end
    
    define_method("#{feature}_price") do
      instance_variable_get("@#{feature}_price")
    end
  end
end

ford = CarModel.new
p ford
ford.engine_info = "Komatsu V8"
p ford.engine_info
ford.engine_price = "2500.00 PLN"
p ford.engine_price
ford.stereo_info = "Bose DTS"
p ford.stereo_info
ford.stereo_price = "Too much!!!"
p ford.stereo_price


# another syntax
class CarModel
  attr_accessor :engine_info, :engine_price, :wheel_info # etc
end


# best way DRY
class CarModel
  # define class macro for setting features
  def self.features(*args)
    args.each do |feature|
      attr_accessor "#{feature}_price", "#{feature}_info"
      # attr_accessor :"#{feature}_price", :"#{feature}_info"
    end
  end
  
  features(:engine, :wheel, :airbag, :alarm, :stereo)
end



mazda = CarModel.new
p mazda
mazda.engine_info = "Komatsu V12"
p mazda.engine_info
mazda.engine_price = "25000.00 PLN"
p mazda.engine_price
mazda.stereo_info = "Bose DD 7.1"
p mazda.stereo_info
mazda.stereo_price = "Gazillion"
p mazda.stereo_price


p "#" * 50, "METHOD MISSING", "#" * 50
# method_missing

class MyGhostClass
  def method_missing(name, *args)
    puts "#{name} was called with arguments #{args.join(",")}"
  end
end

m = MyGhostClass.new
m.awesome_method("one", "two") # => no MethodError (printed when BasicObject#method_missing is called)
m.another_method("home", "boy") #   MyGhostClass#method_missing was called



# only methods with "awesome" in their name should invoke it, others => error
class MyGhostClass
  def method_missing(name, *args)
    if name.to_s =~ /awesome/
      puts "#{name} was called with arguments: #{args.join(",")}"
    else
      # goes to superclass upto BasicObject
      super
    end
  end
end

m.awesome_method("tom", "jerry")
begin
  m.another_method # => NoMethodError 
rescue => e
  p e
end

#awesome_method is not really a method
@m = MyGhostClass.new
p @m.methods
p @m.methods.grep(/awesome/) # => empty arr

# it's actually a ghost method
# plus => can write and execute code for methods, you don't know the name of
# minus => changing ruby's default behaviour may cause hard to find bugs if you're
# not carefull with method names


# to enhance CarModel method

class CarModel
  def method_missing(name, *args)
    name = name.to_s
    super unless name =~ /(_info)|(_price)=?$/
    if name =~ /=$/
      instance_variable_set("@#{name.chop}", args.first)
    else
      instance_variable_get("@#{name}")
    end
  end
end


@car_model = CarModel.new

@car_model.stereo_info = "CD/MP3 Player"
@car_model.stereo_price = "$79.99"

p @car_model.stereo_info, @car_model.stereo_price
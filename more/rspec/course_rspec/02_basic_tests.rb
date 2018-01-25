# define ruby class
class Animal
  @name = nil
  @age = nil
  
  # really basic constructor => assign values to class variables
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  def getName
    return @name
  end
  
  def setName(name)
    @name = name
  end
  
  def getAge
    return @age
  end
  
  def setAge(age)
    @age = age
  end
end

# add rspec template for that class
# animal_test_rspec.rb => file could be also name that way
require "./02_basic_tests.rb"
# require "./02_basic_tests"
# require_relative "02_basic_tests"


describe "Test Animal Class" do
  
  # context area allows to have much more defined area in the test
  context "to test name" do
    it "should get initialized name" do
      # create animal class object and initialize it
      # pass some variables to the constructor
      animal = Animal.new("dino", 5)
  
      # get the name value    
      nameValue = animal.getName
  
      # check that it's correct
      puts nameValue
    end
    
    it "should get set name" do
      # create animal class object and initialize it
      # pass some variables to the constructor
      animal = Animal.new("dino", 5)
      animal.setName("max")
      
      # get the name value    
      nameValue = animal.getName
  
      # check that it's correct
      puts nameValue
    end
  end
  
  context "to test age" do
    it "should get initialized age" do
      # create animal class object and initialize it
      # pass some variables to the constructor
      animal = Animal.new("dino", 5)
  
      # get the name value    
      ageValue = animal.getAge
  
      # check that it's correct
      puts ageValue
    end
    
    it "should get set age" do
      # create animal class object and initialize it
      # pass some variables to the constructor
      animal = Animal.new("dino", 5)
      animal.setAge(10)
      
      # get the name value    
      ageValue = animal.getAge
  
      # check that it's correct
      puts ageValue
    end
  end


  # CAN MOVE THOSE 2 TESTS TO CONTEXT
  # # "it" is treated as "example"
  # it "should get initialized name" do
  #   # create animal class object and initialize it
  #   # pass some variables to the constructor
  #   animal = Animal.new("dino", 5)

  #   # get the name value    
  #   nameValue = animal.getName

  #   # check that it's correct
  #   puts nameValue
  # end
  
  # it "should get set name" do
  #   # create animal class object and initialize it
  #   # pass some variables to the constructor
  #   animal = Animal.new("dino", 5)
  #   animal.setName("max")
    
  #   # get the name value    
  #   nameValue = animal.getName

  #   # check that it's correct
  #   puts nameValue
  # end
  
  # it "should get initialized age" do
  #   # create animal class object and initialize it
  #   # pass some variables to the constructor
  #   animal = Animal.new("dino", 5)

  #   # get the name value    
  #   ageValue = animal.getAge

  #   # check that it's correct
  #   puts ageValue
  # end
  
  # it "should get set age" do
  #   # create animal class object and initialize it
  #   # pass some variables to the constructor
  #   animal = Animal.new("dino", 5)
  #   animal.setAge(10)
    
  #   # get the name value    
  #   ageValue = animal.getAge

  #   # check that it's correct
  #   puts ageValue
  # end
  
end

# dividing into groups (by using context) =>  can run just tests from the context => in ruby mine

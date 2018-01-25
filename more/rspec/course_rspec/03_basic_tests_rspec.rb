# animal_test_rspec.rb => file could be also name that way
require "./02_basic_tests.rb"
# require "./02_basic_tests"
# require_relative "02_basic_tests"


describe "Test Animal Class" do
  
  # "it" is treated as "example"
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
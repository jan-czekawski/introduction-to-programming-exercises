require "selenium-webdriver"

describe "before after test" do
  # run it only once for the whole describe block
  before(:all) do
    puts "before all method started"
    # LOGIC
    puts "open db connection"
    puts "before all method finished"
  end

  # run it only once for the whole describe block
  after(:all) do
    puts "after all method started"
    # LOGIC
    puts "close db connection"
    puts "after all method finished"
  end

  # :ALL are used less frequently than :EACH => can be used to set up
  # some data that is even more outside of test case => eg setting up db connection
  # just between the beginning of all the tests => setting up db using EACH would be
  # to INEFFICIENT

  # run it before each "it" block
  before(:each) do
    puts "before each method started"
    # LOGIC
    puts "creating a new browser and opening it"
    puts "before each method finished"
  end

  # run it after each "it" block
  after(:each) do
    puts "after each method started"
    # LOGIC
    puts "close the browser"
    puts "after each method finished"
  end

  # THE "EACH" hooks should be used for providing initial data TO THE TEST
  # BUT without touching the core concept of the test

  it "test method" do
    puts "test method started"
    # LOGIC
    puts "test"
    puts "test method finished"
  end

  it "test method2" do
    puts "test method2 started"
    # LOGIC
    puts "test"
    puts "test method2 finished"
  end
end
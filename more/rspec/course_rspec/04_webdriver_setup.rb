# gem install selenium-webdriver in bash
# gem list => to see all local gems installed
# add new test template

require "selenium-webdriver"

describe "My zoo site" do

  before(:each) do
    @driver = Selenium::WebDriver.for(:firefox)
    @driver.navigate.to("https://playball-michal8888.herokuapp.com/courts") # zoo site is not available
  end

  it "should open browser and click on contact" do
    # create webdriver driver
    
    # we want to use selenium webdriver against firefox browser
    # it should open the browser
    # driver = Selenium::WebDriver.for(:firefox)
    # driver = Selenium::WebDriver.for(:chrome)
    
    # navigate to some website (our zoo site => http://freelancer.geekngames.com/webapp)
    # driver.navigate.to("https://www.google.com") # zoo site is not available
    # driver.navigate.to("https://playball-michal8888.herokuapp.com/courts") # zoo site is not available
    
    # click on contact link (assume id of the contact link is "contact_link")
    # driver.find_element(:id, "contact_link").click
    @driver.find_element(:id, "loginButton").click
    
    # print out page title
    puts @driver.title
    
    puts @driver.methods

    # close the browser
    # driver.quit
  end
  
  it "should open browser and click on about" do
    @driver.find_element(:id, "signupButton").click
    
    # print out page title
    puts @driver.title
    
    puts @driver.methods
  end
  
  after(:each) do
    @driver.quit
  end
end

# can use gem install geckodriver-helper (from ruby gems) => to install geckodriver
# https://github.com/mozilla/geckodriver
# https://github.com/mozilla/geckodriver/releases

# but firefox is not installed on cloud ide (check with local environment)

# can move first 2 lines to "before" action => will run before each tests
# can move more lines into "after" action 

# before and after methods are run in particular order with tests

# have to be careful about the scope in before, it and after => use instance vars

# we can add more tests => in "it" block

# before(:each) will be run before each "it" tests => before 1 test
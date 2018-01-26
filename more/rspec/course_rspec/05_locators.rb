# locator => will help you find element in the page and act on it during test

require "selenium-webdriver"

describe "my test" do
  
  before(:all) do
    @driver = Selenium::WebDriver.for(:firefox)
    # @driver = Selenium::WebDriver.for(:chrome)
    @driver.navigate.to("https://playball-michal8888.herokuapp.com/courts")
  end
  
  it "do something" do
    # id
    @driver.find_element(:id, "signupButton").click
    
    # # class
    puts @driver.find_element(:class, "modal-title").text # will print out the text

    # # css
    @driver.find_element(:css, "[id=closeSignupModal]").click
    sleep(2)
    @driver.find_element(:css, "[id=closeLoginModal]").click
    
    # name
    sleep(1)
    @driver.find_element(:name, "user[email]").send_keys("boss@wp.pl")
    @driver.find_element(:name, "user[username]").send_keys("Boss")
    @driver.find_element(:name, "user[password]").send_keys("password")
    @driver.find_element(:name, "user[password_confirmation]").send_keys("password")


  end
  
  after(:all) do
    @driver.quit
  end
end

# webdriver offers lots of locators: eg id locator or class name locator
# first we locate the element, then we act on it (click, text, send_keys => type text we provide)

# there's no href locator! => can use css locator


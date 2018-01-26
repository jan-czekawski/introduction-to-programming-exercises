# locator => will help you find element in the page and act on it during test

require "selenium-webdriver"

describe "my test" do
  
  before(:all) do
    @driver = Selenium::WebDriver.for(:firefox)
    @driver.navigate.to("https://playball-michal8888.herokuapp.com/courts")
  end
  
  it "do something" do
    # id
    @driver.find_element(:id, "contact_link").click
    
    # class
    puts @driver.find_element(:class, "subhead").text # will print out the text
    
    # name
    @driver.find_element(:name, "address_field").send_keys("dummy text")

    # css
    @driver.find_element(:css, "[id=adoption_link]").click
  end
  
  after(:all) do
    @driver.quit
  end
end

# webdriver offers lots of locators: eg id locator or class name locator
# first we locate the element, then we act on it (click, text, send_keys => type text we provide)

# there's no href locator! => can use css locator


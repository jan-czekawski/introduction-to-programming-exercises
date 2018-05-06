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
    puts @driver.find_element(:class_name, "modal-title").text # same result

    # # css
    @driver.find_element(:css, "[id=closeSignupModal]").click
    sleep(1)
    @driver.find_element(:css, "[id=closeLoginModal]").click

    # name
    sleep(1)
    @driver.find_element(:name, "user[email]").send_keys("boss@wp.pl")
    @driver.find_element(:name, "user[username]").send_keys("Boss")
    @driver.find_element(:name, "user[password]").send_keys("password")
    @driver.find_element(:name, "user[password_confirmation]").send_keys("password")

    # class
    sleep(1)
    @driver.find_element(:class, "close").click
    sleep(1)

    # link
    # @driver.find_element(:link, "Sign up to add new courts!").click
    # @driver.find_element(:link_text, "Sign up to add new courts!").click # same result

    # partial link
    # @driver.find_element(:partial_link_text, "Sign up to add").click

    # tag name
    puts @driver.find_element(:tag_name, "p").text

    # xpath
    @driver.find_element(:xpath, "/html/body/div[5]/div/div/div[2]/a/div/img").click
    # /html/body/div[5]/div/div/div[2]/a/div/img
  end
  
  after(:all) do
    @driver.quit
  end
end

# webdriver offers lots of locators: eg id locator or class name locator
# first we locate the element, then we act on it (click, text, send_keys => type text we provide)

# there's no href locator! => can use css locator
# can use link locator (if the element is an anchor) => provide text inside of the anchor
# can use partial link locator => provide partial text 
# for paragraph can use "tagname" locator => use name of the tage

# xpath is similar to regex
# xpath locator => can use plugin for ff

# //* => give me the ability to look at all the tags on the page
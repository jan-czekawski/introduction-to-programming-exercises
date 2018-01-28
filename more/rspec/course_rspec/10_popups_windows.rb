require "selenium-webdriver"

describe "popup test" do
  before(:all) do
    @driver = Selenium::WebDriver.for(:firefox)
    # @driver.navigate.to("https://dontyoulikelehane-michal8888.herokuapp.com/")
    @driver.navigate.to("file:///D:/now/github/introduction-to-programming-exercises/more/rspec/course_rspec/practice_page.html")
  end

  after(:all) do
    # @driver.quit
  end

  it "check pop up window" do
    # @driver.find_element(:id, "exitButton").click
    @driver.find_element(:id, "boomButton").click
    
    alertBox = @driver.switch_to.alert
    puts alertBox.text
    alertBox.accept # it clicks on the button

    @driver.find_element(:name, "home").send_keys("test name value")
    @driver.find_element(:id, "boomButton2").click

    alertBox = @driver.switch_to.alert
    puts alertBox.text
    alertBox.accept # it clicks on the button
  end
end

# #switch_to => allows to switch to another action
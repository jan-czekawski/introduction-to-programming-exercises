# page object pattern

# can translate whole page into a class
# in that class we can write specific methods to eg click sth, close sth etc

require "selenium-webdriver"

describe "Testing the page object pattern" do
  before(:all) do
    @driver = Selenium::WebDriver.for(:firefox)
    @driver.navigate.to("https://dontyoulikelehane-michal8888.herokuapp.com/")
  end

  after(:each) do
    @driver.quit
  end

  it "enter valid data and submit" do
    @driver.find_element(:xpath, "//div[@id='bs-example-navbar-collapse-1']/ul[2]/li").click
    @driver.find_element(:id, "user_email").send_keys "harry@hogwarts.com"
    @driver.find_element(:id, "user_password").send_keys "password"
    @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
    # expect(@driver.find_element(:id, 'flash_notice').text).to be == "Signed in successfully."
    p @driver.find_element(:id, 'flash_notice').text
  end


end
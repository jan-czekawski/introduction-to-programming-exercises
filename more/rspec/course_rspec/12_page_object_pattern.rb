# page object pattern

# can translate whole page into a class
# in that class we can write specific methods to eg click sth, close sth etc

require "selenium-webdriver"
require_relative "page_objects/home_page"

describe "Testing the page object pattern" do
  # THE "OLD" WAY
  # before(:all) do
  #   @driver = Selenium::WebDriver.for(:firefox)
  #   @driver.navigate.to("https://dontyoulikelehane-michal8888.herokuapp.com/")
  # end

  # it "enter valid data and submit" do
  #   @driver.find_element(:xpath, "//div[@id='bs-example-navbar-collapse-1']/ul[2]/li").click
  #   @driver.find_element(:id, "user_email").send_keys "harry@hogwarts.com"
  #   @driver.find_element(:id, "user_password").send_keys "password"
  #   @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
  #   # expect(@driver.find_element(:id, 'flash_notice').text).to be == "Signed in successfully."
  #   # p @driver.find_element(:xpath, '//ul[@class="nav navbar-nav"]/li[4]/a').text
  #   expect(@driver.find_element(:xpath, '//ul[@class="nav navbar-nav"]/li[4]/a').text).to be == "Add book"
  # end

  # it "enter invalid data and submit" do
  #   @driver.find_element(:xpath, "//div[@id='bs-example-navbar-collapse-1']/ul[2]/li").click
  #   @driver.find_element(:id, "user_email").send_keys "harry@hogwarts.com"
  #   @driver.find_element(:id, "user_password").send_keys "password"
  #   @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
  #   # expect(@driver.find_element(:id, 'flash_notice').text).to be == "Signed in successfully."
  #   # p @driver.find_element(:xpath, '//ul[@class="nav navbar-nav"]/li[4]/a').text
  #   expect(@driver.find_element(:xpath, '//ul[@class="nav navbar-nav"]/li[4]/a').text).to be == "Add book"
  # end

  # after(:all) do
  #   @driver.quit
  # end


  # NEW WAY
  # we need some new entrance to the app
  app = nil

  before(:each) do
    app = AbstractPage.new(Selenium::WebDriver.for(:firefox))
  end

  it "actual test" do
    login_confirmation = app.navigate_to_app_root
                            .navigate_to_login
                            .fill_in_email("harry@hogwarts.com")
                            .fill_in_password("password")
                            .submit_form
    
    expect(login_confirmation.confirm_user_is_logged_in).to be == "Add book"
  end

  after(:all) do
    app.quit
  end
end

# if we were to copy original first test, we'd be repeating some commands => inefficient

# page object pattern tries to help with that => if we were to write a class that
# contains objects of the specific page => we could use method on them inefficiently

# create new directory /page_objects and create files for each page: home_page, login_page
# and for abstract page => with methods common for few pages

# require "rspec"
require "selenium-webdriver"
# require_relative "home_page"
# require_relative "login_page"

class AbstractPage
  @@driver = nil

  def initialize(driver)
    @@driver = driver
  end

  def navigate_to_app_root
    @@driver.navigate.to("https://dontyoulikelehane-michal8888.herokuapp.com/")
    return HomePage.new(@@driver)
  end

  def quit
    @@driver.quit
  end

  def get_page_title
    return @@driver.title
  end

  def confirm_user_is_logged_in
    @@driver.find_element(:xpath, '//ul[@class="nav navbar-nav"]/li[4]/a').text
  end
end

# we need some method to navigate TO THE PAGE => good idea to put it in abstract page
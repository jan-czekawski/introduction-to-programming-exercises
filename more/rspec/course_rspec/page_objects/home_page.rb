require_relative "abstract_page"
require_relative "login_page"

class HomePage < AbstractPage
  def initialize(driver)
    super(driver)
  end

  def navigate_to_login
    @@driver.find_element(:xpath, "//div[@id='bs-example-navbar-collapse-1']/ul[2]/li").click
    return LoginPage.new(@@driver)
  end
end

# we need to use #super => because we will use single instance of the class, when
# we pass new objects via methods with returning initializers
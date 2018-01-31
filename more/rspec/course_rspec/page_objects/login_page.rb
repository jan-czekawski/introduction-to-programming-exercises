# require_relative "abstract_page"
require_relative "home_page"

class LoginPage < AbstractPage
  def initialize(driver)
    super(driver)
  end

  # @driver.find_element(:id, "user_email").send_keys "harry@hogwarts.com"
  # @driver.find_element(:id, "user_password").send_keys "password"
  # @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click

  def fill_in_email(email)
    @@driver.find_element(:id, "user_email").send_keys(email)
    return LoginPage.new(@@driver)
    # we're returning instance of the same class, because page objects pattern should return
    # same object when you're done with it => you've filled in email in the driver (and updated)
    # the object 
  end

  def fill_in_password(password)
    @@driver.find_element(:id, "user_password").send_keys(password)
    return LoginPage.new(@@driver)
  end

  def submit_form
    @@driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
    return HomePage.new(@@driver)
    # 
  end
end

# we're creating new instances of the class, but returning same instance of the class variable

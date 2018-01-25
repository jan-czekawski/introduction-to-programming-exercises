# gem install selenium-webdriver in bash
# gem list => to see all local gems installed
# add new test template

require "selenium-webdriver"

describe "My zoo site" do
  it "should open browser and click on contact" do
    # create webdriver driver
    
    # we want to use selenium webdriver against firefox browser
    # it should open the browser
    driver = Selenium::WebDriver.for(:firefox)
    
    # navigate to some website (our zoo site => http://freelancer.geekngames.com/webapp)
    driver.navigate.to("https://www.google.com") # zoo site is not available
    
    # click on contact link (assume id of the contact link is "contact_link")
    driver.find_element(:id, "contact_link").click
    
    # print out page title
    puts driver.title
    
    # close the browser
    driver.quit
    
  end
end

# can use gem install geckodriver-helper (from ruby gems) => to install geckodriver
# https://github.com/mozilla/geckodriver
# https://github.com/mozilla/geckodriver/releases

# but firefox is not installed on cloud ide (check with local environment)
# 10:27
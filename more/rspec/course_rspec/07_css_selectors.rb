require "selenium-webdriver"

describe "Css selector test" do
  before(:all) do
    @driver = Selenium::WebDriver.for(:firefox)
    @driver.navigate.to("https://dontyoulikelehane-michal8888.herokuapp.com/")
  end

  it "do sth" do
    # find by id
    puts @driver.find_element(:css, "#bs-example-navbar-collapse-1").text + " :: found by id"
    puts @driver.find_element(:css, "#bs-example-navbar-collapse-1 ul li a").text + " :: found by id"
    
    # find by tag
    puts @driver.find_element(:css, "h1").text + " :: found by tag"
    
    # find by absolute path
    # very brittle => i couldn't find one => always an error
    # puts @driver.find_element(:css, "html>body>nav>div.nth-child(1)>div.nth-child(2)>ul>li.nth-child(2)>a").text + " :: found by absolute path"
  end

  after(:all) do
    @driver.quit
  end
end

# can be helpful to also use css selectors
# "html>body" => body is descendant of html => child, html is parent
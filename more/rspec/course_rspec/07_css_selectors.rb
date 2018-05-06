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
    # very brittle => use div:nth-child
    puts @driver.find_element(:css, "html>body>nav>div:nth-child(1)>div:nth-child(2)>ul>li:nth-child(2)>a").text + " :: found by absolute path"
    # puts @driver.find_element(:css, "html>body>nav>div:nth-child(1)").text + " :: found by absolute path"
        
    # find by child node or subnode
    # puts @driver.find_element(:css, "html body nav div.nth-child(1)>div.nth-child(2)>ul>li.nth-child(2)>a").text + " :: found by child node or subnodeh"  
    puts @driver.find_element(:css, "html body nav").text + " :: found by child node or subnode"  

    # find by attribute
    puts @driver.find_element(:css, "[id=bs-example-navbar-collapse-1]").text + " :: found by attribute"
    puts @driver.find_element(:css, "[name=viewport]").text + " :: found by attribute"

    # find by more than 1 attribute
    puts @driver.find_element(:css, "[name=csrf-param][content=authenticity_token]").text + " :: found by two attributes"

    # find by class
    puts @driver.find_element(:css, "div.bookContent strong").text + " :: found by class"

    # find by prefix
    puts @driver.find_element(:css, "[id^=bs-example]").text + " :: found by prefix"

    # find by suffix
    puts @driver.find_element(:css, "[id$=-collapse-1]").text + " :: found by suffix"
  
    # find by substring
    puts @driver.find_element(:css, "[id*=example-navbar]").text + " :: found by substring"
  end

  after(:all) do
    @driver.quit
  end
end

# can be helpful to also use css selectors
# "html>body" => body is descendant of html => child, html is parent
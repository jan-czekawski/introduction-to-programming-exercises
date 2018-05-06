# can use xpath to find any section of the webpage

require "selenium-webdriver"

describe "Practice xpath" do
  
  before(:all) do
    @driver = Selenium::WebDriver.for(:firefox)
    @driver.navigate.to("https://dontyoulikelehane-michal8888.herokuapp.com/")
  end

  it "do xpath magic" do
    # print out the text from paragraph

    # example of full absolute path
    puts @driver.find_element(:xpath, "/html/body/div[3]/p").text
    
    # count in square bracket starts from "1" => not from "0"

    # example of using "//" => decendants concept
    puts @driver.find_element(:xpath, "//body//div[3]/p").text
    puts @driver.find_element(:xpath, "//body/div[3]/p").text
    puts @driver.find_element(:xpath, "//div[3]/p").text

    # can use wildcard
    puts @driver.find_element(:xpath, "//*/*/p").text

    # can use attribute
    # when using classes => have to list all of them, not just the one
    puts @driver.find_element(:xpath, '//div[@class="jumbotron center landingJumbo"]/p').text

  end

  after(:all) do
    @driver.quit
  end
end

# we want to select some tag => there's hierarchy (parent/child relationship):
# html => body => div[3] (third div => starts from 1) => p etc.

# "/" => start from the root path (html)
# "//" => look from anywhere in the browser (will look through more tags => more flexible)

# "/html/body/table/tbody/tr[2]/td[2]/h1"
# "//table//tr[2]/td[2]/h1" => start anywhere, when you find a table (there's only 1), start anywhere
# inside of the table (there's only 1 tbody) and find tr[2] etc...

# can find sth by attribute => eg "id" (is attribute and has some value), "class" (same) etc

# IF YOU DON'T HAVE TO => DON'T USE XPATH => USE ID/CLASS LOCATORS
# BUT IF THE ACCESS TO SECTIONS IS DIFFICULT WITH USING ID/CLASS, THEN USE XPATH 
# IT'S MORE FLEXIBLE, BUT MORE BRITTLE
# collection => group of web elements located together (as part of the list)
# can look at multiple elements at the same time

require "selenium-webdriver"

describe "Collection test" do
  before(:all) do 
    @driver = Selenium::WebDriver.for(:firefox)
    @driver.navigate.to("https://dontyoulikelehane-michal8888.herokuapp.com/")
  end

  it "run test" do
    # grab all the links on the page
    tag_list = @driver.find_elements(:tag_name, "a") # rets 0 or many(all) results
    # @driver.find_element(:by, "") # => returns 0 or 1(first one) result
  
    # look through them => by using loops
    for i in tag_list
      puts "value of i is #{i.text}"
    end

    tag_list.each do |item|
      puts "foreach value of i is #{item.text}"
      # puts "LOG IN IS NEXT TO LAST ITEM" if item.text == "Log in"
      # next if item.text == "Posts"
      # break "COWABUNGA" if item.text == "Sign up"
      
      if item.text == "Log in"
        next
        puts "this line should not print out"
      end

      if item.text == "Posts"
        puts "Found about"
      end

      if item.text == "Sign up"
        break
      end
    end

    # as we looking we want to do sth when we find the link we looking for
  end

  after(:all) do
    @driver.quit
  end
end
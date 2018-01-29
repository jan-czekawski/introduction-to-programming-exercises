require "selenium-webdriver"

describe "popup test" do
  before(:all) do
    @driver = Selenium::WebDriver.for(:firefox)
    # @driver.navigate.to("https://dontyoulikelehane-michal8888.herokuapp.com/")
    @driver.navigate.to("file:///D:/now/github/introduction-to-programming-exercises/more/rspec/course_rspec/practice_page.html")
  end

  after(:all) do
    @driver.quit
  end

  it "check pop up window" do
    # @driver.find_element(:id, "exitButton").click
    @driver.find_element(:id, "boomButton").click
    
    alertBox = @driver.switch_to.alert
    puts alertBox.text
    alertBox.accept # it clicks on the button

    @driver.find_element(:name, "home").send_keys("test name value")
    @driver.find_element(:id, "boomButton2").click

    alertBox = @driver.switch_to.alert
    puts alertBox.text
    alertBox.accept # it clicks on the button
  end

  it "check window handle" do
    # get the current window we are in control
    mainWindow = @driver.window_handle
    
    # open a new window
    @driver.find_element(:id, "windowClick").click
    
    # get all current windows (we're saving the current window state in the variable)
    allWindows = @driver.window_handles # rets 0 or many windows (same as with elements)

    # find any new windows open
    allWindows.each do |window|
      @newWindow = window unless mainWindow == window
    end

    # switch to the window of our choic
    @driver.switch_to.window(@newWindow)
    # do sth on that window
    puts @driver.find_element(:tag_name, "h1").text
    @driver.close

    # we can switch back if we want
    @driver.switch_to.window(mainWindow) 
    puts @driver.find_element(:id, "exitButton").text
  end
end

# #switch_to => allows to switch to another action
# #window_handle => rets current window you're in control => acts as a reference to it

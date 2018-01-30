require "selenium-webdriver"

describe "to test should and expect" do
  it "test method" do
    num_one = 5
    num_two = 10
    total = num_one + num_two
    puts total

    # SHOULD
    # total.should == 15 # will give deprecation warning
    # total.should be == 15 # will give deprecation warning
    # total.should == 16 # rets failure
    # total.should >= 16 # rets failure
    # total.should be != 16 # OK
    # someobject.should be_true

    # EXPECT
    # expect(total).to be == 15
    # expect(total).to eq(15)
    # expect(total).to equal(16)
    
    # puts @driver.title
    title = @driver.title
    title.should be == "Don't You Like Lehane?"
    expect(title).to be == "Don't You Like Lehane?"

  end

  before(:all) do
    @driver = Selenium::WebDriver.for(:firefox)
    @driver.navigate.to("https://dontyoulikelehane-michal8888.herokuapp.com/")
  end

  after(:all) do
    @driver.quit
  end
end

# #should and #expect are methods used for validation

# #should => gives deprecation warning => won't be used much longer


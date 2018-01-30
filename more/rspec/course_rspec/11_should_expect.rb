require "selenium-webdriver"

describe "to test should and expect" do
  it "test method" do
    num_one = 5
    num_two = 10
    total = num_one + num_two
    puts total
    total.should == 15 # will give deprecation warning
    total.should be == 15 # will give deprecation warning
    # total.should == 16 # rets failure
    # total.should >= 16 # rets failure
    total.should != 16 # OK
    # someobject.should be_true
  end
end

# #should and #expect are methods used for validation

# #should => gives deprecation warning => won't be used much longer


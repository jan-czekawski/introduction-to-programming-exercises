# install ruby (and ruby devkit on windows)
# install rubymine (if you want => ruby ide)
# run ruby installer (and extract devkit to folder in windows)

# connect ruby devkit with ruby path
# highlight ruby devkit folder => rmb => open command window here
# dk.rb init => enter => initialization
# dk.rb install => enter => installation

# ruby -v => check if ruby is installed
# gem -v => version of gem you're using => manager to install etc packages in ruby
# gem install rspec => install rspec
# rspec -v => check if rspec is installed

# install rubymine
# open rubymine

# create new project
# give it a name (rspectConcept)
# make directory (src)

# create new rspec test template
# filename => name of the test
# behaviour name => description of the test
# it should => name of the part of the test

# created template
# require "rspec"

describe "My very first rspec test class" do
  it "should first test of many" do
    puts "first test passed"
    # true.should == false
  end

  it "should first test of many" do
    puts "first test passed"
    # true.should == false
  end

  it "should first test of many" do
    puts "first test passed"
    # true.should == false
  end
end

# to run it => rmb => run (ctrl shift f8)

# in linux => comment require "rspec" and just type rspec 01_setup.rb to run the test

# can use "set" in the bash to see paths
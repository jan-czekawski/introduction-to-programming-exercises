require 'rails_helper'

Rspec.describe Agent, "#favorite_gadget" do
  
  # That's not good practice!!! => it would be much more expressive 
  # to set up needed object on test-by-test basis !!! =>
  before(:each) do
    @gadget = Gadget.create(name: "Walther PPK")
  end
  
  it "returns one item, favorite gadget of the agent" do
    agent = Agent.create(name: "James Bond")
    agent.favorite_gadget << @gadget
    
    expect(agent.favorite_gadget).to eq "Walther PPK"
  end
  
end
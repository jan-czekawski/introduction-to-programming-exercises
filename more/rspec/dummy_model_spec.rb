require 'rails_helper'

RSpec.describe DummyModel, type: :model do

  describe Agent, "#favorite_gadget" do
    
    it "returns one item, the favorite gadget of the agent" do
      # Setup
      agent = Agent.create(name: "James Bond")
      q = Quatermaster.create(name: "Q")
      q.technical_briefing(agent)
      
      # Exercise
      favorite_gadget = agent.favorite_gadget
      
      # Verify      => exercise and verify are clearly separated from each other here
      expect(favorite_gadget).to eq "Walther PPK"
  
      # Teardown is for now handled mostly by Rspec itself
    end
  
  end
end


      # not divided would be
      # expect(agent.favorite_gadget).to eq "Walter PPK"
      
      
# Rspec.describe DummyModel, type: model do
  
#   describe Agent, "#favorite_gadget" do
    
#     it "some clever description" do
#       expect(agent.enemy).to eq "Ernst Stavro Blofeld"
#       expect(agent.enemy).not_to eq "Winnie Pooh"
#     end
#   end
# end
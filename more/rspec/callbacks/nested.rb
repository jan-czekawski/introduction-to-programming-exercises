require "rails_helper"

Rspec.describe Agent do
  
  before(:each) do
    @mission = Mission.create(name: "Moonraker")
    @bond = Agent.create(name: "James Bond", number: "007")
  end
  
  describe "#enemy" do
    before(:each) do
      @main_villain = Villain.create(name: "Ernst Stavro")
      @mission.villains << @main_villain
    end
    
    describe "Double 0 agent with associated missions" do
      it "returns the main enemy the agent has to face in his missions" do
        @mission.agents << @bond
        
        expect(@bond.enemy).to eq "Ernst Stavro Blofeld"
      end
    end
    
    describe "Low level agent with associated missions" do
      it "returns no info about the villain involved" do
        some_schmuck = Agent.create(name: "Some Schmuck", number: "1024")
        @mission.agents << some_schmuck
        
        expect(some_schmuck.enemy).to eq "That's above your paygrade!"
      end
    end
  end
end
require 'rails_helper'

Rspec.describe Agent, "#enemy" do
  
  before(:all) do
    @main_villain = Villain.create(name: "Ernst Stavro Blofeld")
    @mission = Mission.create(name: "Moonraker")
    @mission.villains << @main_villain
  end
  
  it "returns the main enemy Bond has to face in his mission" do
    agent = Agent.create(name: "James Bond")
    @mission.agents << agent
    
    expect(agent.enemy).to eq "Ernst Stavro Blofeld"
  end
  
end
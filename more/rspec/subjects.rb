require 'rails_helper'

Rspec.describe Agent, "#status" do
  subject { Agent.create(name: "James Bond") }
  
  it "returns the agent's status" do
    expect(subject.status).not_to be "MIA"
  end
end
# ...







# this test doesn't tell us much
# we don't know about agent in question => it's created somewhere else, so we have to hunt him down
describe Agent, "#print_favorite_gadget" do
  it "prints out the agent's name , rank and favorite gadget" do
    expect(agent.print_favorite_gadget).to eq("Commander Bond has a thing for Aston Martin")
  end
end

# better implementation of the same test
describe Agent, "#print_favorite_gadget" do
  it "prints out the agent's name, rank and favorite gadget" do
    agent = Agent.new(name: "James Bond", rank: "Commander", favorite_gadget: "Aston Martin")
    
    expect(agent.print_favorite_gadget).to eq("Commander Bond has a thing for Aston Martins")
  end
end



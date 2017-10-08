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


# good implementation of another test
# we have all the info this test needs in 1 place and don't need to look for specifics
# it tells story and is not obscure. Not best strategy for DRY code.
# But clarity and readability outweigh this little bit of repetitive code by longshot
# especially in large codebases
describe Agent, "#current_mission" do
  
  it "prints out the agent's current mission status and its objective" do
    mission_octopussy = Mission.new(name: "Octopussy", objective: "Stop bad white dude")
    bond = Agent.new(name: "James Bond", status: "Undercover operation",
                     section: "00", licence_to_kill: true)
    bond.missions << mission_octopussy
    expect(bond.current_mission).to eq("Agent Bond is currently engaged in an undercover operation for mission Octopussy which aims to stop bad white dude")
  end

end
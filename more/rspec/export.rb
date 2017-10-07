# this code is repetitive => pre export
describe Agent, "#current_status" do
  
  it "speculates about the agent's choice of destination if status is vacation" do
    bond = Agent.new(name: "James Bond", status: "On vacation", section: "00", licence_to_kill: true)
    
    expect(bond.current_status).to eq("Commander Bond is on vacation, probably in the Bahamas")
  end
  
  it "speculates about the quatermaster's choice of destination if status is vacation" do
    q = Agent.new(name: "Q", status: "On vacation", section: "00", licence_to_kill: true)
    
    expect(q.current_status).to eq("The quatermaster is on vacation, probably at DEF CON")
  end
end
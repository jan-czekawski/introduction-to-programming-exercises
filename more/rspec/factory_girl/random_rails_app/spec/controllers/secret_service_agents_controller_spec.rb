require 'rails_helper'

RSpec.describe SecretServiceAgentsController, type: :controller do

  # example of spec used with attributes_for method
  it "redirects to some location" do
    post :create, spy: attributes_for(:spy)
    
    expect(response).to redirect_to(some_location)
  end
  
  # some_spec.rb
  it "check attributes of agents" do
    bond = create(:bond)
    quatermaster = create(:quatermaster)
    
    quatermaster.name # => "Q"
    quatermaster.skills # => "Inventing gizmos and hacking"
    quatermaster.licence_to_kill # => false
    
    bond.name # => "James Bond"
    bond.skills # => "Espionage and intelligence"
    bond.licence_to_kill # => true
  end

end

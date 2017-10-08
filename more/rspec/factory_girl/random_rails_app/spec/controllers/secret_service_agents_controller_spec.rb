require 'rails_helper'

RSpec.describe SecretServiceAgentsController, type: :controller do

  # example of spec used with attributes_for method
  it "redirects to some location" do
    post :create, spy: attributes_for(:spy)
    
    expect(response).to redirect_to(some_location)
  end

end

require "rails_helper"

describe Agent, :whip do
  
  it 'is a mess right now' do
    expect(agent.favorite_gadgets).to eg 'Unknown'
  end
end

# rspec --tag whip => to run it
# rspec --tag ~whip => to run everything but
# rpsec --tag whip --tag ~checkout (can run multiple tags asynchronously)
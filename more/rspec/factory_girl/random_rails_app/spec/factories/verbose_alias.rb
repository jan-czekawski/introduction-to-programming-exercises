# could do it also more verbosely
FactoryGirl.define do
  
  factory :agent, aliases: [:mulder] do
    name "Fox Mulder"
    job "Chasing bad dudes"
    special_skills "Investigation and intelligence"
  end
  
  factory :law_enforcement_vehicle do
    name "Oldsmobile Achieva"
    kind "Compact car"
    association :owner, factory: :agent
  end
  
end

# can use aliases to "build" factory objects right away

fbi_agent = create(:mulder)
fbi_agent.name # => "Fox Mulder"
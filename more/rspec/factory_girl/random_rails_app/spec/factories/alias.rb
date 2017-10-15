FactoryGirl.define do
  
  factory :agent, aliases: [:owner] do
    name "Fox Mulder"
    job "Chasing bad dudes"
    special_skills "Investigation and intelligence"
    
    factory :double_0_seven do
      name "James Bond"
    end
  end
  
  factory :law_enforcement_vehicle do
    name "Oldsmobile Achieva"
    kind "Compact car"
    :owner
  end
  
  factory :spy_car do
    name "Aston Martin DB9"
    kind "Sports car"
    double_0_seven
  end
  
end
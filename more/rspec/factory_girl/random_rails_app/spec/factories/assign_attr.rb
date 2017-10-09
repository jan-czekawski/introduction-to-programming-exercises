FactoryGirl.define do

# sequence has to have the same name as attr to be assigned automatically
  sequence :email do |n|
    "00#{n}@mi6.com"
  end

  factory :secret_service_agent do
    name "Edward Donne"
    email
    skills "Espionage and infiltration"
    license_to_kill true
  end
  
end

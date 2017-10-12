FactoryGirl.define do
 
  factory :supervillain do
    name       'Karl Stromberg'
    passion    'marine biology'
    ambition   'human extinction'
    motivation 'save the oceans'
    profile    { "#{name} has a passion for #{passion} and aims to #{motivation} through #{ambition}."}
  end
 
end
 
# villain = create(:supervillain)
# villain.profile 
# # => "Karl Stromberg has a passion for marine biology and aims to save the oceans through human extinction."
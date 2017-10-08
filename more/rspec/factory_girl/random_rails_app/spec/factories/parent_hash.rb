FactoryGirl.define do

# Spy class that needs to adapt to 3 different scenarios (parent hash)

  factory :spy do
    name "Mary McSpy"
    favorite_gadget "Hoverboard"
    skills "Espionage and intelligence"
  end
  
  factory :quatermaster, parent: :spy do
    name "Q"
    skills "Inventing gizmos and hacking"
  end
    
  factory :bond, parent: :spy do
    name "James Bond"
    licence_to_kill true
  end
  
end
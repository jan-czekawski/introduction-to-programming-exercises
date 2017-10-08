FactoryGirl.define do

# Spy class that needs to adapt to 3 different scenarios (nesting)

  factory :spy do
    name "Mary McSpy"
    favorite_gadget "Hoverboard"
    skills "Timetravelling"
    
    factory :quatermaster do
      name "Q"
      skills "Inventing gizmos and hacking"
    end
    
    factory :bond do
      name "James Bond"
      licence_to_kill true
    end
  end
  
end
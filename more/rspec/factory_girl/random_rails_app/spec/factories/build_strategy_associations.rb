FactoryGirl.define do
  # to avoid saving associated object
  
  factory :quatermaster do
    name "Q"
    skills "Inventing stuff"
  end
  
  factory :computer do
    model "Custom Lenovo ThinkPad W Series"
    association :quatermaster, strategy: :build
  end
  
  # # THIS WOULDN'T WORK
  # factory :computer do
  #   model "Custom Lenovo ThinkPad W Series"
  #   quatermaster, strategy: :build
  # end
  
end
FactoryGirl.define do
  # object is of Computer class and its instances belong to Quatermaster class
  
  factory :quatermaster do
    name "Q"
    skills "Inventing stuff"
  end
  
  factory :computer do
    model "Custom Lenovo ThinkPad W Series"
    quatermaster
  end
  
end
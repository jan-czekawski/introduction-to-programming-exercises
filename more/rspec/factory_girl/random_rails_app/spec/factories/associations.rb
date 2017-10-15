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
# BUT if you used create(:quatermaster) it will build and save both Q and ThinkPad
# using build(:quatermaster) wouldn't hit db, but would only apply to quatermaster,
# ThinkPad would still get saved


# in file factories/gun.rb
FactoryGirl.define do
  
  before(:stub, :build, :create) { |object| object.assign_serial_number }
  
  factory :spy_gun do
    name "Walther PPK"
    ammunition "7.65mm Browning"
    association :owner
    
    factory :golden_gun do
      name "Custom Lazar"
      ammunition "24-carat gold bullet"
      after(:create) { |golden_gun| golden_gun.erase_serial_number }
    end
  end
end
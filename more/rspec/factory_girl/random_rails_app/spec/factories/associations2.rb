# let's say spies use gun, that has many cartridges(bullets)

# class Cartridge < ActiveRecord::Base
#   belongs_to :gun
# end

# class Gun < ActiveRecord::Base
#   has_many :cartridges
# end

FactoryGirl.define do
  factory :cartridge do
    caliber "7.65"
    gun
  end
  
  factory :gun do
    name "Walther PPK"
    ammunition "7.65mm Browning"
    caliber "7.65"
    
    factory :gun_with_ammo do
      transient do
        magazine_size 10
      end
      
      after(:create) do |gun, evaluator|
        create_list(:cartridge, evaluator.magazine_size, gun: gun)
      end
    end
  end
end


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

# callbacks are handy in this situation. Now can build gun with or without ammo.
# Via the hash gun: gun you provided the "cartridge" factory with the
# necessary info to create association via foreign_key

spy_gun = create(:gun)
spy_gun.cartridges.length # => 0

spy_gun_with_ammo = create(:gun_with_ammo)
spy_gun_with_ammo.cartridges.length # => 10

# if you need another magazine size you can pass it in via your transient attr

big_magazine_gun = create(:gun_with_ammo, magazine_size: 20)
big_magazine_gun.cartridges.length # => 20

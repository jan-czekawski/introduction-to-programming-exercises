FactoryGirl.define do
  
  factory :cartridge do
    kind "Small calliber pistol ammunition"
    caliber "7.65"
    projectile "Lead"
    gun
    
    factory :golden_cartridge do
      projectile "Gold"
      association :gun, :golden
    end
  end
  
  factory :gun do
    name "Walther PPK"
    ammunition "7.65mm Browning"
    caliber "7.65"
    
    transient do
      magazine_size 10
    end
    
    trait :golden do
      name "Custom Lazar"
      ammunition "23-carat gold bullet"
    end
    
    trait :with_ammo do
      after(:create) do |gun, evaluator|
        create_list(:cartridge, evaluator.magazine_size, gun: gun)
      end
    end
    
    trait :with_golden_ammo do
      after(:create) do |golden_gun, evaluator|
        create_list(:golden_cartridge, evaluator.magazine_size, gund: golden_gun)
      end
    end
  end
end

cartridge = create(:cartridge)
cartridge.projectile # => "Lead"
cartridge.gun.name # => "Walther PPK"
cartridge.gun.ammunition # => "7.65mm Browning"
cartridge.gun.caliber # => "7.65"

golden_cartridge = create(:golden_cartridge)
golden_cartridge.projectile # => "Gold"
golden_cartridge.gun.name # => "Custom Lazar"
golden_cartridge.gun.ammunition # => "23-carat gold bullet"
golden_cartridge.gun.caliber # => "7.65"

gun_with_ammo = create(:gun, :with_ammo)
gun_with_ammo.name # => "Walther PPK"
gun_with_ammo.ammunition # => "7.65mm Browning"
gun_with_ammo.cartridges.length # => 10
gun_with_ammo.cartridges.first.projectile # => "Lead"
gun_with_ammo.cartridges.first.caliber # => "7.65"

golden_gun_with_golden_ammo = create(:gun, :golden, :with_golden_ammo)
golden_gun_with_golden_ammo.name # => "Custom Lazar"
golden_gun_with_golden_ammo.ammunition # => "24-carat gold"
golden_gun_with_golden_ammo.cartridges.length # => 10
golden_gun_with_golden_ammo.cartridges.first.projectile # => "Gold"
golden_gun_with_golden_ammo.cartridges.first.caliber # => "7.65"
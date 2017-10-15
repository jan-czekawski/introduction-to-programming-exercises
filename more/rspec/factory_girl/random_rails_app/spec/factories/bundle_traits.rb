FactoryGirl.define do
  
  factory :spy_car do
    model "Aston Martin DB9"
    top_speed "295 km/h"
    build_date "2015"
    ejection_seat true
    
    trait :submarine do
      ejection_seat false
      water_resistant "100 m"
      submarine_capabilities true
      air_independent_propulsion true
    end
    
    trait :weaponized do
      rockets true
      number_of_rockets "12"
      machine_gun true
      rate_of_fire "1,500 RPM"
      tank_armour true
    end
    
    trait :cloaked do
      active_camouflage true
      radar_signature "reduced"
      engine "silenced"
    end
    
    trait :night_vision do
      infrared_sensors true
      heads_up_display true
    end
  end
  
  factory :invisible_spy_car, traits: [:cloaked, :night_vision]
  factory :diving_spy_car, traits: [:submarine, :cloaked]
  factory :tank_spy_car, traits: [:weaponized, :night_vision]
  factory :ultimate_spy_car, traits: [:cloaked, :night_vision, :submarine]
end

# can create these objects more concisely and it's mroe readable too
build_stubbed(:invisible_spy_car)
create(:ultimate_spy_car)

# instead of:
build_stubbed(:spy_car, :cloaked, :night_vision)
create(:spy_car, :cloaked, :night_vision, :submarine, :weaponized)
# reads better, especially when no variable names are involved


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
  
end

invisible_spy_car = create(:spy_car, :cloaked, :night_vision)
diving_spy_car = create(:spy_car, :submarine, :cloaked)
tank_spy_car = create(:spy_car, :weaponized, :night_vision)

# can even override individual attr simultaneously by passing hash
build(:spy_car, :submarine, ejection_seat: true)

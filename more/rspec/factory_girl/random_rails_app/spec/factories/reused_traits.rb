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
    
    trait :mobile_surveillance do
      cloaked
      night_vision
      signal_detector true
      signal_analyzer true
      wifi_war_driver true
      license_plate_reader true
      mini_drone true
    end
  end
  
  factory :ultimate_spy_car, parent: :spy_car do
    car_plane true
    submarine
    weaponized
    mobile_surveillance
  end
end

# mobile_surveillance trait resuses cloaked and night_vision traits like attr
# also ultimate_spy_car factory reuses all traits plus additional att that makes it fly too

# create/build_list can use traits, 2nd param is number of factory instances you want
create_list(:spy_car, 3, :night_vision)
build_list(:spy_car, 4, :submarine, :cloaked)


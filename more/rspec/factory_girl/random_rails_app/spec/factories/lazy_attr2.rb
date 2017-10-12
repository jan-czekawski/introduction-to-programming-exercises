FactoryGirl.define do
 
  factory :aston_martin do
    sequence(:vehicle_id_number, 9) {|n| "A_M_#{n}"}
  end
 
end
 
# spycar_01 = create(:aston_martin)
# spycar_01.vehicle_id_number
# # => "A_M_9"
 
# spycar_02 = create(:aston_martin)
# spycar_02.vehicle_id_number
# # => "A_M_10"
 
# # ...
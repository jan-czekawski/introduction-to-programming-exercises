FactoryGirl.define do
  factory :spy do
    name 'Marty McFly'
    after(:stub, :build) { |spy| spy.assign_new_mission }
  end
end
FactoryGirl.define do
 
  factory :ninja do
    name "Ra’s al Ghul"
 
    factory :ninja_with_shuriken do
      transient do
        number_of_shuriken 10
      end
 
      after(:create) do |ninja, evaluator|
        create_list(:shuriken, evaluator.number_of_shuriken, ninja: ninja)
      end
    end
  end
 
  factory :shuriken do
    name             'Hira-shuriken'
    number_of_spikes 'Four'
    ninja
  end
 
end
 
# ninja = create(:ninja)
# ninja.shurikens.length # => 0
 
# ninja = create(:ninja_with_shuriken)
# ninja.shurikens.length # => 10
 
# ninja = create(:ninja_with_shuriken, number_of_shuriken: 20)
# ninja.shurikens.length # => 20
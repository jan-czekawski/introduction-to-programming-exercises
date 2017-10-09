FactoryGirl.define do

  sequence :spy_email do |n|
    "00#{n}@mi6.com"
  end

  factory :spy do
    name "Marty McSpy"
    email "marty@thepinheads.com"
    skills "Espionage and intelligence"
    license_to_kill false
    
    factory :elite_spy do
      name "Edward Donne"
      license_to_kill true
    end
  end
  
end

# in spec
# top_spy = create(:elite_spy)
# top_spy.email = generate(:spy_email)

# top_spy.email # => "001@mi6.com"
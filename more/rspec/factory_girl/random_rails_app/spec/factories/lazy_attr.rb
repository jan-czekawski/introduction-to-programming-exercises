FactoryGirl.define do
 
  sequence :mission_deployment do |number|
    "Mission #{number} at #{DateTime.now.to_formatted_s(:short)}"
  end
 
  factory :spy do
    name 'Marty McSpy'
    deployment { generate(:mission_deployment) }
  end
 
end
 
# some_spy = create(:spy)
# some_spy.deployment # => "Mission #1 at 19 Oct 21:13"
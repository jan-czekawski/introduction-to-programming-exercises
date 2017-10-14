FactoryGirl.define do
  factory :spy do
    name              'Marty McSpy'
    skills            'Espionage and infiltration'
    deployment_status 'Preparing mission'
  end
end
 
FactoryGirl.modify do
  sequence :mission_deployment do |number|
    "Mission #{number} at #{DateTime.now.to_formatted_s(:short)}"
  end
 
  factory :spy do
    name            'James Bond'
    skills          'CQC and poker'
    favorite_weapon 'Walther PPK'
    body_count      'Classified'
    favorite_car    'Aston Martin DB9'
    deployment      { generate(:mission_deployment) }
    end
end
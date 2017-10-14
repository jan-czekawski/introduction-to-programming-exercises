FactoryGirl.define do
  factory :henchman do
    name 'Mr. Hinx'
    after(:create) { |henchman| henchman.send_on_kill_mission }
    after(:create) { send_cleaner }
  end
end

FactoryGirl.define do
  factory :bond_girl do
    name 'Lucia Sciarra'
    after(:build)  { |bond_girl| bond_girl.hide_secret_documents  }
    after(:create) { close_hidden_safe_compartment }
  end
end
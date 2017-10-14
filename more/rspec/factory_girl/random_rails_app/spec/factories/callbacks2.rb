FactoryGirl.define do
 
  factory :double_agent do
    after(:stub) { |double_agent| assign_new_identity(double_agent) }
  end
 
end
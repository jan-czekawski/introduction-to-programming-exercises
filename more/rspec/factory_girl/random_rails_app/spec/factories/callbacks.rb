FactoryGirl.define do
   
  factory :mission do
    objective        'Stopping the bad dude'
    provided_gadgets 'Mini submarine and shark gun'
    after(:build)    { assign_support_analyst }
  end
 
end

# before(:create) executes a code block before your factory instance is saved.
# Activated when you use create(:some_object).

# after(:create) executes a code block after your factory instance is saved.
# Activated when you use create(:some_object).

# after(:build) executes a code block after your factory object has been built
# in memory. Activated when you use both build(:some_object) and create(:some_object).

# after(:stub) executes a code block after your factory has created a
# stubbed object. Activated when you use build_stubbed(:some_object).

# custom(:your_custom_callback) executes a custom callback without
# the need to prepend before or after.
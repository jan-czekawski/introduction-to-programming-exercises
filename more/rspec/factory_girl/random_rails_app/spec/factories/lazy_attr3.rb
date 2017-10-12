FactoryGirl.define do
 
  factory :exploding_device do
   
    transient do
      countdown_seconds 10*60
      time_of_explosion { Time.now + countdown_seconds }
    end
 
    time_of_explosion { "Exploding in #{countdown_seconds} seconds #{time_of_explosion.strftime("at %I:%M %p")}" }
  end
 
end
 
# ticking_device = create(:exploding_device)
# ticking_device.time_of_explosion
# # => "Exploding in 600 seconds at 11:53 PM"
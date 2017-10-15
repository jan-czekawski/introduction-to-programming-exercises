# via explicit association call, can refer to different factory names and
# change attr on the fly
FactoryGirl.define do
 
  factory :quartermaster do
    name 'Q'
  end
 
  factory :computer do
    model 'Custom Lenovo ThinkPad W Series'
    association :hacker, factory: :quartermaster, skills: 'Hacking'
    end
 
end
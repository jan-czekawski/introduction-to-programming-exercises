FactoryGirl.define do
 
  factory :supervillain do
 
    transient do
      megalomaniac false
      cat_owner false
    end
 
    name       'Karl Stromberg'
    passion    'marine biology'
    ambition   'human extinction'
    motivation { "Building an underwater civilization#{" and saving the world" if megalomaniac}" }
    profile    { "Insane business tycoon#{" – friends with Blofeld" if cat_owner}" }
  end
 
end
 
# villain = create(:supervillain)
# villain.profile
# # => "Insane business tycoon"
# villain.motivation
# # => "Building an underwater civilization"
 
# cat_friendly_villain = create(:supervillain, cat_owner: true)
# cat_friendly_villain.profile
# # => "Insane business tycoon – friends with Blofeld"
 
# narcissistic_villain = create(:supervillain, megalomaniac: true)
# narcissistic_villain.motivation
# # => "Building an underwater civilization and saving the world"
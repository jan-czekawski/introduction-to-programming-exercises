FactoryGirl.define do

  factory :spy do
    name "Mary McSpy"
    favorite_gadget "Hoverboard"
    skills "Espionage and intelligence"
    
    factory :quatermaster do
      name "Q"
      skills "Inventing gizmos and hacking"
    end
    
    factory :bond do
      name "James Bond"
      licence_to_kill true
    end
  end
  
  # in some_spec
  # spy_clones = create_list(:spy, 3)
  # fake_spies = build_list(:spy, 3)
  # spy_clones # => [#<Spy id: 1, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Infiltration and espionage\", created_at: \"2015-10-18 18:52:02\", updated_at: \"2015-10-18 18:52:02\">, #<Spy id: 2, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Infiltration and espionage\", created_at: \"2015-10-18 18:52:02\", updated_at: \"2015-10-18 18:52:02\">, #<Spy id: 3, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Infiltration and espionage\", created_at: \"2015-10-18 18:52:02\", updated_at: \"2015-10-18 18:52:02\">]
  # fake_spies # => [#<Spy id: nil, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Infiltration and espionage\", created_at: nil, updated_at: nil>, #<Spy id: nil, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Infiltration and espionage\", created_at: nil, updated_at: nil>, #<Spy id: nil, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Infiltration and espionage\", created_at: nil, updated_at: nil>]

  # OVERWRITES
  # smug_spies = create_list(:spy, 3, skills: 'Smug jokes')
  # double_agents = build_list(:spy, 3, name: 'Vesper Lynd', skills: 'Seduction and bookkeeping')
  # smug_spies # => [#<Spy id: 1, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Smug jokes\", created_at: \"2015-10-18 19:08:07\", updated_at: \"2015-10-18 19:08:07\">, #<Spy id: 2, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Smug jokes\", created_at: \"2015-10-18 19:08:07\", updated_at: \"2015-10-18 19:08:07\">, #<Spy id: 3, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Smug jokes\", created_at: \"2015-10-18 19:08:07\", updated_at: \"2015-10-18 19:08:07\">]
  # double_agents # => [#<Spy id: nil, name: \"Vesper Lynd\", function: \"Covert agent\", skills: \"Seduction and bookkeeping\", created_at: nil, updated_at: nil>, #<Spy id: nil, name: \"Vesper Lynd\", function: \"Covert agent\", skills: \"Seduction and bookkeeping\", created_at: nil, updated_at: nil>, #<Spy id: nil, name: \"Vesper Lynd\", function: \"Covert agent\", skills: \"Seduction and bookkeeping\", created_at: nil, updated_at: nil>] 

  # CREATE PAIR 
  # create_pair(:spy)
  # => [#<Spy id: 1, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Infiltration and espionage\", created_at: \"2015-10-18 19:31:41\", updated_at: \"2015-10-18 19:31:41\">, #<Spy id: 2, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Infiltration and espionage\", created_at: \"2015-10-18 19:31:41\", updated_at: \"2015-10-18 19:31:41\">]
  # build_pair(:spy)
  # => [#<Spy id: nil, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Infiltration and espionage\", created_at: nil, updated_at: nil>, #<Spy id: nil, name: \"Marty McSpy\", function: \"Covert agent\", skills: \"Infiltration and espionage\", created_at: nil, updated_at: nil>]
end
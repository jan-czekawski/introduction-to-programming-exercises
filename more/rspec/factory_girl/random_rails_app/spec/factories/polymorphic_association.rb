class Spy < ActiveRecord::Base
  belongs_to :spyable, polymorphic: true
end

class MIFive < ActiveRecord::Base
  has_many :spies, as: :spyable
end

class MISix < ActiveRecord::Base
  has_many :spies, as: :spyable
end

FactoryGirl.define do
  
  factory :mifive do
    name "Military Inteligence, Section 5"
    principal_activity "Domestic counter-intelligence"
  end
  
  factory :misix do
    name "Military Intelligence, Section 6"
    principal_activity "Foreign counter-intelligence"
  end
  
  factory :mifive_spy, class: Spy do
    name "005"
    association :spyable, factory: :mifive
  end
  
  factory :misix_spy, class: Spy do
    name "006"
    association :spyable, factory: :misix
  end
end

# MI5 agents
mifive = create(:mifive)
mifive_spy = create(:mifive_spy)
mifive.spies << mifive_spy

mifive.name  # => "Military Intelligence, Section 5"
mifive_spy.name # => "005"
mifive.spies.length # => 1
mifive.spies.first.name # => "005"

# MI6 agents
misix = create(:misix)
misix_spy_01 = create(:misix_spy, name: "007")
misix_spy_02 = create(:misix_spy)
misix.spies << misix_spy_01
misix.spies << misix_spy_02

misix.name # => "Military Intelligence, Section 6"
misix.spies.length # => 2
misix_spy_01.name # => "007"
misix_spy_02.name # => "006"
misix.spies.first.name # => "007"


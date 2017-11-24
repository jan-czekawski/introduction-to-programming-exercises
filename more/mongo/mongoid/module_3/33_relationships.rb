# parent doc of the relatoin must declare embeds_one macro to indicate it has one
# embedded child

# doc that is embeddes uses embedded_in
# Actor -> place_of_birth:Place

class Place
  include Mongoid::Document
  # (...)
  embedded_in :locatable, polymorphic: true
end

class Actor
  include Mongoid::Document
  # (...)
  embeds_one :place_of_birth, as: :locatable, class_name: "Place"
end

class Writer
  include Mongoid::Document
  # (...)
  embeds_one :hometown, as: :locatable, class_name: "Place"
end
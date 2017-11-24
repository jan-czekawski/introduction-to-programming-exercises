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

# Polymorphic relationships
# embedding same doc type in several different parent type
# Child -> polymporphic

actor = Actor.where(place_of_birth: { :$exists => 0 }).first
oakland = Place.where(city: "Oakland").first
actor.create_place_of_birth(oakland.attributes)

pp Actor.collection.find(_id: actor.id).first

writer = Writer.where(hometown: { :$exists => 0 }).first
pp Writer.collection.find(_id: writer.id).first
oakland = Place.where(city: "Oakland").first
writer.create_hometown(oakland.attributes)

pp Writer.collection.find(_id: writer.id).first

# 00:48:09
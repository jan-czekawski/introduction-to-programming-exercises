# parent doc of the relation must declare embeds_one macro to indicate it has one
# embedded child

# doc that is embedded uses embedded_in
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

# .create_place_of_birth can be used because it's defined in embeds_one
# it's an example of .create_relationship
actor.create_place_of_birth(oakland.attributes)

pp Actor.collection.find(_id: actor.id).first

# polymorphic behaviour => can insert another copy of the same embedded obj
# in another collection
writer = Writer.where(hometown: { :$exists => 0 }).first
pp Writer.collection.find(_id: writer.id).first
oakland = Place.where(city: "Oakland").first

# another example of .create_relationship
writer.create_hometown(oakland.attributes)

pp Writer.collection.find(_id: writer.id).first

# we can inspect writer obj methods
writer.methods.grep(/hometown/)

writer.hometown.id
writer.hometown?
writer.has_hometown?

# example of .build_relationship method
place = writer.build_hometown

writer.create_hometown
writer.has_hometown? # even though it's empty it still evals to true
writer.hometown = nil
writer.has_hometown? # => false

pp Writer.collection.find(_id: writer.id).first # hometown is gone

# simple assignment doesn't embedded transient association
writer.hometown # nil
writer.hometown = oakland
writer.hometown # rets oakland with attr
pp Writer.collection.find(_id: writer.id).first # no hometown associated

writer.save
pp Writer.collection.find(_id: writer.id).first # STILL NO HOMETOWN
# have to use .build_ or .create_
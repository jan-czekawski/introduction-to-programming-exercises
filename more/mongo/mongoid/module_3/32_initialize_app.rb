# import data => it can also drop the collection and reimport the data
# rake db:seed

# setup index
# rake db:mongoid:create_indexes

# 1 of the index was created in models/actor.rb
embeds_one :place_of_birth, class_name: 'Place' , as: :locatable
index ({ :"place_of_birth.geolocation" => Mongo::Index::GEO2DSPHERE })

# CUSTOM TYPES: Measurement (measurement info), Point (geolocation points)
class Measurement
  attr_reader :amount, :units
  
  # initialize, mongoize, self.mongoize, self.demongoize, self.evolve
  # are used for changing Ruby class into Mongo types and vice-versa etc
  # (...)
end

class Point
  attr_reader :longitutde, :latitude
  # geoJSON format
end

# Model Types and Doc Representation:
# Document Model Class:
Place # abstraction added to Point; stores location about geoloc point
Actor # person having role in Movie
Writer # 1 of the authors
Director # 1 of the dirs
Movie # core info about the movie
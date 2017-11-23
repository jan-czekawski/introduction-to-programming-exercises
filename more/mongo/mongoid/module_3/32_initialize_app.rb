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

# they all have different kind of relationship with other classes

class Writer
  # (...)
  field :name, type: String
  
  embeds_one :hometown, as: :locatable, class_name: "Place"
  has_and_belongs_to_many :movies 
end

class Movies
  # (...)
  field :directors, type: Array
  field :actors, type: Array
  
  embeds_many :roles, class_name: "MovieRole"
  embeds_many :directors, class_name: "DirectorRef"
  has_and_belongs_to_many :writers
  has_one :sequel, class_name: "Movie"
end

# ANOTHER DOCUMENT MODEL CLASS:
DirectorRef # => annotated reference to Director
# annotated => used to cache stable/core director info that the referencing
# doc/view may need
MovieRole # => character in Movie played by Actor
          
# Relationship types:
              
# one:one embedded => Actor -> place_of_birth:Place
# many:one linked => Director -> residence:Place
# one:many embedded => Movie <-> roles:MovieRole
# many:one embedded linked => MovieRole <-> Actor
# one:one linked => Movie -> sequel_to:Movie
# many:many => Movie <-> writers:Writer

# Models are keys as relations are associations between 1 model and another
# in the domain and in the db

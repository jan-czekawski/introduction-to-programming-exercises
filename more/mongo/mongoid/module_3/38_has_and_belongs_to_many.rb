# many to many
# bidirectional relationship

# many to many rel where inverse docs are stored in separate collection

# BOTH parent and child use Mongoid "has_and_belongs_to_many" macro

# foreign key IDs are stored as arrays on either side of the relation

# each side has primary key and the other side stores that as foreign key in a collection
# eg Movie has pk (movie._id) and movie will have multiple (3) writers =>
# Movie will have id of all 3 writers => all writers would have corresponding movie._id

# Movie will have many writers, Writers will have many movies

class Writers
  include Mongoid::Document
  field :name, type: String
  embeds_one :hometown, as: :locatable, class_name: "Place"
  # (...)
  has_and_belongs_to_many :movies
  # (...)
end

# "belongs_to" => stores fk to the parent doc
# "has_many" => it is parent of many child docs

class Movie
  include Mongoid::Document
  field :title, type: String
  # (...)
  has_and_belongs_to_many :writers
  # (...)
end

stone = Writer.where(name: {:$regex => "Stone"}).first
stone.movies.map { |m| m.title }

# can also go the other way => add hometown to the writer and get hometown
# from the reference to the movie

nyc = Place.where(_id: {:$regex => "^New York, NY"}).first
stone.create_hometown(nyc.attributes)
platoon = Movie.where(title: "Platoon").first

# we'll try to get to hometown through writer 
platoon.writers.first.hometown.id

# ANOTHER EXAMPLE OF MANY TO MANY
# will create new movie (no writers)
rambo10 = Movie.create(_id: "tt99990000", title: "Rambo X")
pp Movie.collection.find(title: "Rambo X").first

stone = Writer.where(name: { :$regex => "Stone" }).first
pp Writer.collection.find(_id: stone.id).first

rambo10.writers << stone
# mangoid updated both ends of the collection with FK of the other
pp Movie.collection.find(_id: rambo10.id).first
pp Writer.collection.find(_id: stone.id).first

# works both ways
stone.movies.map { |m| m.title }
rambo10.writers.map { |w| w.name }

# DELETE => when rel is deleted from 1 end it will also delete from the 2 end
stone.movies.delete(rambo10)

# no rambo in the stone's movies
pp Writer.collection.find(_id: stone.id).first
# no stone.id in writers_id
pp Movie.collection.find(_id: rambo10.id).first


# Queries
# find, find_by, find_or_create_by, find_or_initialize_by

# find => find a doc(s) by their IDs; will raise error by default if any of the IDs do not match
Actor.find("nm0993498").birth_name
Actor.find("nm0000006", "nm0000008")

# error handling is automatically built-in => invalid id => error
Actor.find("nm099001112348").birth_name

# find_by
Movie.find_by(title: "Rocky")
Movie.find_by(rated: "R")

# find_or_create_by => find doc by the attr; if not found create and return a new persisted one
Movie.find_by(title: "Titanic")
Movie.find_or_create_by(title: "Titanic", year: "1997")
# no it's there
Movie.find_by(title: "Titanic")


# find_or_initialize_by => same as the previous, BUT IT DOESN'T SAVE and returns NOT PERSISTED one
Movie.find_by(title: "Prisoners")
Movie.find_or_initialize_by(title: "Prisoners", year: "2013")
# still not there => wasn't saved
Movie.find_by(title: "Prisoners")
m = Movie.find_or_initialize_by(title: "Prisoners", year: "2013")
m.save
Movie.find_by(title: "Prisoners")

# WHERE (count, distinct)
Movie.where(title: "Rocky").count
# if there are multiple results of the query => distinct will return only
# specific attr of each (distinct) record in Array
Movie.where(:year.gt => 2000).distinct(:title)
# Schema Design lecture reference => year should be a number => can use 'gt' or 'lt' queries
# BUT Mongoid also supports ASCII compare => can compare strings

Movie.where(rated: "R").first
Movie.exists?
Movie.where(title: "Titanic").exists?

# WHERE(:$exists, :$regex)
# locate first writer that doesn't have hometown
writer = Writer.where(:hometown => { :$exists => 0 }).first
# first actor with name matched
damon = Actor.where(:name => { :$regex => "Matt Da" }).first

# WHERE(geolocation query)
# In mongoid, every model class has the built-in ability to express and execute
# geolocation query

class Actor
  include Mongoid::Document
  include Mongoid::Timestamps
  # (...)

  # belongs to class Place
  embeds_one :place_of_birth, class_name: "Place", as: :locatable
  index ({ :"place_of_birth.geolocation" => Mongo::Index::GEO2DSPHERE })
end

# Point has latitude and longitude defined in it
class Point
  # (...)
  field :geolocation, type: Point
  # (...)
end

silver_spring = Place.where(city: "Silver Spring", state: "MD").first
Actor.near(:"place_of_birth.geolocation" => silver_spring.geolocation)
     .limit(5)
     .each { |actor| pp "#{actor.name}, pob=#{actor.place_of_birth.id}"}

# WHERE(first_or_create)
# Find the 1st doc by the provided attr
# if not found, create and return new, persisted one

Movie.where(title: "Rocky20").to_a
Movie.where(title: "Rocky20").first_or_create
Movie.where(title: "Rocky20").to_a

# WHERE (first_or_initialize)
# Find the 1st doc by the provided attr
# if not found, instantiate and return new one
Movie.where(title: "Rocky21").to_a
m = Movie.where(title: "Rocky21").first_or_initialize
Movie.where(title: "Rocky21").to_a
m.save
Movie.where(title: "Rocky21").to_a
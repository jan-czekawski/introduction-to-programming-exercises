# rails new movies
# cd movies
# gem 'mongoid', '~> 5.0.0'
# bundle install
# rails g mongoid:config config/mongoid.yml
# rails s

# custom classes (anonymous blocks of info within the doc)
# Measurement
# Point

# #initialize => normalized form - independent source of formats
# #to_s => useful in producing formatted output
# #mongoize => creates a DB form of the instance

# more methods
# self.demongoize(object) => creates an instance of the class from the DB-form
# of the data
# self.mongoize(object) => takes in all forms of the object and produces DB
# friendly form
# self.evolve(object) => used by criteria to convert object to DB-friendly form

# SCAFFOLDING
# mongoid is the default model generator: to be explicit at command line, 
# add the --orm mongoid

# Place => models a point and its descriptive address info
# rails g model Place formatted_address geolocation:Point street_number \
# street_name city postal_code county state country

# Director => models the detailed info of a movie director
# rails g model Director name

# DirectorRef => annotated reference to a director that gets embedded into the Movie
# rails g model DirectorRef name

# Writer => holds detailed info about the writer of the movie
# this class is directly associated with the movie without an annotated link
# rails g model Writer name

# Actor => contains the info details of an actor in a Movie
# rails g model Actor name birth_name date_of_birth:Date height:Measurement bio:text


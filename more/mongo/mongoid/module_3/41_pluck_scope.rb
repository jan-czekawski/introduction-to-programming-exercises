# pluck => will get all the non nil values for the provided field
Movie.all.pluck(:title)

# entire doc is not returned; selected fields at the db level
# using a projection is retrieved

# entire doc is returned, grab 2 fields, rest is discarded
Movie.where(rated: "PG").map { |movie| [movie.title, movie.release_date]}

# projection => only 2 fields are returned
Movie.where(rated: "PG").pluck(:title, :release_date)

# using lt with a string
Movie.where(:title.lt => "A").pluck(:title)

# scope => provides good way to reuse common criteria with more business
# domain style syntax

# named scopes => are simply criteria defined at class load that are referenced
# by a provided name
class Movie
  # (...)
  field :year, type: Integer
  scope :current, ->{ where(:year.gt => Date.current.year - 5) }
end

Movie.current.where(rated: "R").pluck(:title, :year) 

# can use multiple scopes

# instead of providing criteria in the query => can do it
# in the code on the db layer

# default scope => can be useful when applying same criteria
# to most queries and you want something to be there by default

class Movie
  field :active, type: Boolean, default: true
end

# same criteria to most queries and something to be there by default
class Airline
  include Mongoid::Document
  field :name, type: String
  field :active, type: Boolean, default: true
  
  default_scope ->{ where(active: true) }
end

airlineUA = Airline.create(name: "UNITED")
airlineLH = Airline.create(name: "LUFTHANSA")
airlinePA = Airline.create(name: "PANAM", active: false)

Airline.each do |airline|
  # all airlines here are active
end

Airline.all.count # => 2
# SELECT * from airlines where active = true
Airline.unscoped.all.count # => 3
# SELECT * from airlines

# OR and IN

# union with IN => second condition (AND)
Movie.where(:year.gt => 2014).in(title: ["The Martian"]).pluck(:plot)

# union with OR => or ID or title 
Movie.or({id: "tt3659388"}, {title: "The Martian"}).pluck(:plot)
# works even if we make a mistake with id => title stil works => id or title
Movie.or({id: "tt3659388xxx"}, {title: "The Martian"}).pluck(:plot)
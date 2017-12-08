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
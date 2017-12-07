# pluck => will get all the non nil values for the provided field
Movie.all.pluck(:title)

# entire doc is not returned; selected fields at the db level
# using a projection is retrieved

# entire doc is returned, grab 2 fields, rest is discarded
Movie.where(rated: "PG").map { |movie| [movie.title, movie.release_date]}

# projection => only 2 fields are returned
Movie.where(rated: "PG").pluck(:title, :release_date)

Movie.where(:title.lt => "A").pluck(:title)
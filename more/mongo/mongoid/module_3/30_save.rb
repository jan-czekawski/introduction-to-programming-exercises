# to save changes in the db
movie  = Movie.new(title: "Rocky", type: "Action", rated: "R", year: 1975)
Movie.find_by(title: "Rocky") # => error
movie.save
Movie.find_by(title: "Rocky") # => OK

# can be used for update
movie.year = 1986
movie.save

# for update can also use
movie = Movie.new(title: "Rocky31", rated: "PG-13")
movie.save
movie.update_attributes(rated: "R")
Movie.find_by(title: "Rocky31")
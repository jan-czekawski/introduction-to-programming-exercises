# CREATE DOES 2 things: creates objects and saves it
movie = Movie.create(title: "Martian", type: "Thriller", rated: "R", year: 2015)
# will insert doc into movies collection

# Movie will automatically create collection colled "movies" (if it doesn't already exist)

# to check if it's there
m = Movie.find_by(title: "Martian")

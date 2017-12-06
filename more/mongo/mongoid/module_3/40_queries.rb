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

# 2:08:08
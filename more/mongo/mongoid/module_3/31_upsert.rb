# performs MongoDB upsert on the doc
# if doc exists => it will overwrite it
# if not => it will get inserted

# overwrite
movie = Movie.create(title: "Rocky31", rated: "PG-13")
Movie.new(_id: "<ID>", title: "Rocky31", rated: "R").upsert

# insert
movie.delete
Movie.find_by(title: "Rocky31") # => error
Movie.new(title: "Rocky31", rated: "R").upsert
Movie.find_by(title: "Rocky31")

# DELETE will delete doc in the db
movie.delete

# will delete all docs from 'movies' collection
Movie.delete_all

movie = Movie.create(title: "Rocky31", rated: "PG-13")
movie.delete
movie = Movie.find_by(title: "Rocky31") # => error

# MONGOID SUPPORTS ALL CRUD operations
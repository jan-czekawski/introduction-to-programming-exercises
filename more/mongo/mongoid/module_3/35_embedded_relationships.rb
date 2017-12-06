# Parent document of the relation uses the embeds_many to indicate it has
# N number of embedded children

# Doc that is embedded uses embedded_in

class Movie
  include Mongoid::Document
  field :title, type: String
  # (...)
  embeds_many :roles, class_name: "MovieRole"
  # (...)
end

class MovieRole
  include Mongoid::Document
  field :character, type: String
  field :actorName, as: :actor_name, type: String
  field :main, type: Mongoid::Boolean
  # (...)
  embedded_in :movie
  # (...)
end

rocky25 = Movie.create(_id: "tt9000000", title: "Rocky XXV")
stallone = Actor.where(name: {:$regex => "Stallone"}).first
rocky = rocky25.roles.create(_id: stallone.id,
                             character: "Rocky",
                             actorName: "Sly",
                             main: true)
                             
pp Movie.collection.find(title: "Rocky XXV").first

# adding second role
actor = Actor.first
role = MovieRole.new
role.id = actor.id
role.character = "Challanger"
role.main = false
role.actor_name = actor.name
rocky25.roles << role

pp Movie.collection.find(title: "Rocky XXV").first

rocky26 = Movie.new(_id: "tt9000001", title: "Rocky XXVI")
rocky = rocky26.roles.build(_id: stallone.id,character: "Rocky", actorName: "Sly", main: true)
rocky26.roles << role

pp Movie.collection.find(title: "Rocky XXVI").first
rocky26.save
pp Movie.collection.find(title: "Rocky XXVI").first

# embedded object (role) can provide reference to its parent doc
role.movie.title


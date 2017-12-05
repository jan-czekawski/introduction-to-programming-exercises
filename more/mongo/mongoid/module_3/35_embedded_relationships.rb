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
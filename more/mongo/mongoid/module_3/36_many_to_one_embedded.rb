# it's not official relationship type => very common
# sometimes Embedded link <=> Annotated link

# many actors in a movie, but each play specific role
# MovieRole <-> Actor

class MovieRole
  include Mongoid::Document
  field :character, type: String
  field :actorName, as: :actor_name, type: String
  field :main, type: Mongoid::Boolean
  embedded_in :movie
  # (...)
  belongs_to :actor, :foreign_key => :_id
  # (...)
end
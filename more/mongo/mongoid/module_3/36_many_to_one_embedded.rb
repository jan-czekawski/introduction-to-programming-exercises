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
  belongs_to :actor, :foreign_key => :_id # can get info on actor by _id
  # (...)
end

class Actor
  include Mongoid::Document
  field :name, type: String
  
  # can write has_many to embedded class => have to write application logic
  # has_many roles:, class_name: "MovieRole"
  
  def roles
    Movie.where(:"roles._id" => self.id) # where role._id matches specific_actor.id
         .map { |m| m.roles.where(:_id => self.id).first }
  end
  
end

damon = Actor.where(:name => { :$regex => "Matt Da"}).first
movie = Movie.where(:"roles._id" => damon.id).first
role = movie.roles.where(:id => damon.id).first
pp role.attributes

# 1:11:10
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

# try defined method #roles to get the roles associated with the actor
pp damon.roles.map { |role| "#{role.movie.title} => #{role.character}"}

# we'll try add actor to fake role in fake movie

# create fake movie
rocky26 = Movie.create(:_id => "tt9000015", :title => "Rocky 26")

# add fake role
rocky = rocky26.roles.create(_id: damon.id, character: "Rocky", actorName: "Matt", main: true)

# can see Matt Damon in the fake role in fake movie
pp Movie.collection.find(title: "Rocky 26").first

# try to find associated movies to actor Matt Damon => rocky 26 is there
pp damon.roles.map { |role| "#{role.movie.title} => #{role.character}" }

# "one" side has primary key and typically has no reference to the child within the doc

# "many" side will typically host the foreign key

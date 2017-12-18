# Rails resources
# rails g scaffold

# rails g model Movie title
# rails g model Actor name
# rails g model MovieRole character

# model classes
class Movie
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  
  embeds_many :roles, class_name: "MovieRole"
end

class Actor
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  
  def roles
    Movie.where(:"roles.actor_id" => self.id).map { |m| m.roles.where(:actor_id => self.id).first }
  end
end

class MovieRole
  include Mongoid::Document
  field :character, type: String
  
  embedded_in :movie
  belongs_to :actor
end

# create some data
movie = Movie.create(id: "12345", title: "rocky25")
actor = Actor.create(id: "100", name: "Sylvester Stallone")
rocky = movie.roles.create(id: "0", character: "rocky")

# find the data
rocky = Movie.find("12345").roles.where(id: "0").first
actor = Actor.find("100")

# connect the data
rocky.actor = actor
rocky.save

# erorr
Movie.find("12345").roles.where(id: "0").first.actor.name
# ok
Movie.find("12345").roles.where(id: "100").first.actor.name

# in actor.rb
def roles
  Movie.where(:"roles.actor_id"=>self.id).map {|m| m.roles.where(:actor_id=>self.id).first}
end 

def roles
  Movie.where(:"roles._id"=>self.id).map {|m| m.roles.where(:_id=>self.id).first}
end 

actor.roles.map { |r| "#{r.movie.title}, #{r.character}"}



# URI vs URL vs URN
# URI
# expose resources using standard URIs
# Rails will automatically create URIs
# will register the resource in config/routes.rb

# rails g scaffold_controller Movie title
# rails g scaffold_controller Actor name

# in config/routes.rb
Rails.application.routes.draw do
  resources :movies
  resources :actors
end

# rake routes => to check it
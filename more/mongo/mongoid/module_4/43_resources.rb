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
rails g scaffold_controller MovieRole character actor_id

# have to register movie_roles resources nested in movies
Rails.application.routes.draw do
  resources :movies do
    resources :movie_roles, as: :role, path: "roles"
    # as: :role => to have routes more clear
  end
  resources :actors
end

# in controllers/movie_roles_controller.rb
before_action :set_movie_role, only: [:show, :edit, :update, :destroy]

def show
end

  def set_movie_role
    @movie_role = Movie.find(params[:movie_id]).roles.find_by(:id => params[:id])
  end
  
  
# JSON Marshaller 
# default json marshaller expects timestamp
# app/views/movie_roles/show.json.builder
json.extract! @movie_role, :id, :character, :actor_id, :created_at, :updated_at

# remove field for display
json.extract! @movie_role, :id, :character, :actor_name

HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/movies/tt3659388/roles/nm0000354.json").parsed_response

# returns nil
HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/movies/tt3659388/roles.json").parsed_response
# generated index method is quering movie role as if it was global resource

# to fix it
movie.roles.create(:id => "1", :character => "challanger")
Movie.find("12345").roles

# define before_action and update set_movie_role
# update JSON marshaller

# in movie_roles_controller.rb
class MovieRolesController < ApplicationController
  before_action :set_movie
  before_action :set_movie_role, only: [:show, :edit, :update, :destroy]
  
  # ...
  
  def index
    @movie_roles = @movie.roles
  end
  
    def set_movie_role
      @movie_role = @movie.roles.find_by(:id => params[:id])
    end
    
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
end

# update JSON marshaller from:
json.array!(@movie_roles) do |movie_role|
  json.extract! movie_role, :id, :character, :actor_id
  json.url movie_role_url(movie_role, format: :json)
end

# to:
json.array!(@movie_roles) do |movie_role|
  json.extract! movie_role, :id, :character, :actor_name
  json.url movie_role_url(@movie, movie_role, format: :json)
end

# test if it works
pp HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/movies/tt3659388/roles.json").parsed_response
pp HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/movies/12345/roles.json").parsed_response


# OAuth 2

# OAuth stands for "Open Authorization"
# Open standard protocol that provides simple and secure authorization for different
# types of apps

# Allows providers to give access to users without any exchange of credentials

# Authorization framework that enables apps to get limited access to suer accounts
# on http service like FB, GitHub, TT etc.

# Problems with Password Approach:

# Users have to share credentials
# Not secure and intrusive
# Hard to maintain when you authorize many apps(change password at provider - eg FB - clients need to be updated)


# OAuth 2 approach
# secure - no passwords are exchanged; uses tokens; allows providers to give access to users without any exchange of credentials

# OAuth 2.0 is the next evolution of the OAuth protocol which was originally created in late 2006

# ASSEMBLY
# Core Setup
# create new Rails app
# rails new oauth_movies
# cd oauth_movies

# add gems
# mongoid; httparty

# integrate mongoid
# rails g mongoid:config

# define root url
# rails g controller pages index

# config/routes.rb
Rails.application.routes.draw do
  # get 'pages/index'
  root to: 'pages/index'
end


# Resource access
# html controller => movies
# rails g model Movie id title

# config/routes.rb
resources :movies

# Add timestamp
class Movie
  include Mongoid::Document
  include Mongoid::Timestamps
  # field :id, type: String
  field :title, type: String

  # last_modifier will store identity of who changed the movie last 
  field :last_modifier, type: String

end

# Resource controller

# Movies Controller
# rails g scaffold_controller Movies id title

# config/routes.rb
resources :movies

# Two controllers: HTML and API specific

# API controller
# Update the gemfile with "responders" gem
# # automatic marshalling
# # gem 'responders', '~> 2.1', '>= 2.1.1'

# Add controller (create directory => app/controller/api)

# add files to controller/api

# base controller will be used to hold any properties that are common to all API classes
# base_controller.rb
module Api
  class BaseController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json
  end
end

# movies controller focuses on web services interaction
module Api
  class MoviesController < Api::BaseController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    
    def index
      respond_with Movie.all
    end
    
    def show
      respond_with @movie
    end
    
    def create
      respond_with Movie.create(movie_params)
    end
    
    def update
      respond_with @movie.update(movie_params)
    end
    
    def destroy
      respond_with @movie.destroy
    end
    
    private
      def set_movie
        @movie = Movie.find(params[:id])
        
        rescue Mongoid::Errors::DocumentNotFound => e
          respond_to do |format|
            format.json { render json: { msg: "movie[#{params[:id]}] not found"}, status: :not_found }
          end
      end
      
      def movie_params
        params.require(:movie).permit(:id, :title)
      end
      
      
  end
end

# Add URI routes to the API controller
# config/routes.rb
resources :movies
namespace :api, defaults: { format: 'json'} do
  resources :movies
end

response = HTTParty.post("https://third-mongoid-workspace-michal8888.c9users.io/api/movies",
                         :body => { :movie => { :id => "54321", :title => "rocky25" }})

reponse.response
# HTTPCreated 201 Created readbody=true

pp JSON.parse(response.body)

response = HTTParty.put("https://third-mongoid-workspace-michal8888.c9users.io/api/movies/54321",
                         :body => { :movie => { :title => "rocky25.5" }})

response = HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/api/movies/54321")
response.response
# HTTPOK 200 OK readbody=true

response = HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/api/movies/543")
response.response
# HTTPNotFound 404 Not Found readbody=true


response = HTTParty.delete("https://third-mongoid-workspace-michal8888.c9users.io/api/movies/54321")
response.response
# HTTPNoContent 204


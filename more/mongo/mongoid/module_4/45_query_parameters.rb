
# HTTParty Client class

# helper class - app/services/movies_ws.rb
class MoviesWS
  include HTTParty
  base_uri "https://third-mongoid-workspace-michal8888.c9users.io"
end

# can use that to check which paths are autoloaded
# bin/rails runner 'p ActiveSupport::Dependencies.autoload_paths'

# or in the console:
ActiveSupport::Dependencies.autoload_paths

# spring prevents adding "/services" to the autoloaded paths, have to restart it
# (bin/)spring stop

MoviesWS.get("/movies/12345.json").parsed_response

# Parameter types => URI elements (e.g. :movie_id, :id)
# Query String => part of the URI, uses "?" and contains individual query params
# POST data => in the payload body

# example
MoviesWS.get("/movies.json?title=rocky25&foo=1&bar=2&baz=3").parsed_response
# POST will fail => protection CSRF
MoviesWS.post("/movies.json",
  :body => { :movie => { :id => "123457", :title => "rocky27", :foo => "bar"}}.to_json,
  :headers => { "Content-Type" => "application/json"})
  

# White Listing Params
# rails has built-in feature based on parameters
# controller has a "white list" of acceptable params

# white list with 2 fields:
def movie_params
  params.require(:movie).permit(:id, :title)
end

# usage:
def create
  @movie = Movie.new(movie_params)
end

# XSS - cross site scripting

# browser can run scripts (JS)

# if user trusts the website he might allow the scripts to run
# <script type="text/javascript"> alert("Hard Disk Error. Click OK."); </script>
# example of stupid script => someone might believe it

# it's possible to inject malicious scripts into content from trusted sites
# Scripts can hijack user sessions, redirect user to other sites

# POST requst by default will fail
# can't verify CSRF (Cross Site Request Forgery) token authenticity - message

# Relax security
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
end

# now can create new movie from the console
response = MoviesWS.post("/movies.json",
      :body => { :movie => { :id => "123457", :title => "rocky27", :foo => "bar"}}.to_json,
      :headers => { "Content-Type" => "application/json"})

response.response
response.parsed_response


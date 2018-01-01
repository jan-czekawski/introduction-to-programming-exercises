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
MoviesWS.post("/movies.json",
  :body => { :movie => { :id => "123457", :title => "rocky27", :foo => "bar"}}.to_json,
  :headers => { "Content-Type" => "application/json"})
  

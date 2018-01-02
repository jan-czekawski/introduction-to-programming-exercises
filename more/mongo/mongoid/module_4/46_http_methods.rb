# POST is for creating new resource instances
# POST to resource URI, Provide JSON payload (optional), Provide MIME type of the payload
# in the Content-Type header

MoviesWS.post("/movies.json", :body => { :movie => {:id => "54321", :title => "rocky54"}}.to_json, :headers => { "Content-Type" => "application/json"})
# without: :headers => { "Content-Type" => "application/json"} => incorrect parsing

# PUT is for replacing the data (update)
# client => issues PUT request, issues request to /movies/54321 URI, provides
# JSON payload for update and application/json MIME type
response = MoviesWS.put("/movies/54321.json", :body => { :movie => { :title => "rocky5400", :foo => "bar"}}.to_json, :headers => { "Content-Type" => "application/json"})

# PUT(update) - action
# PUT expects primary key to be in :id param; if the movie is found, processing
# continues; builds white-list-checked set of params; supplies values to update
# method; returns the result doc

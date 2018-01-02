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


# PATCH is for partially updating a resource 
# update a field vs entire resource

MoviesWS.patch("/movies/54321.json", :body => { :movie => { :title => "rocky5402", :foo => "bar"}}.to_json, :headers => { "Content-Type" => "application/json"})

# from rails implementation standpoint (scaffolding and command standpoint) PATCH and PUT
# have the same implementation => it's for less bandwith => PATCH will use less bandwith


# HEAD
# basically GET without response body; useful to retrieve meta-info written in
# response headers; issue GET and store Etag for comparison later
response = MoviesWS.get("/movies/54321.json")
response.header["etag"]
doc = response.parsed_response

response = MoviesWS.head("/movies/54321.json")
response.header["etag"]
doc = response.parsed_response # rets nil

# HEAD, and then if etag changes, then you fetch actual data with GET

# now we'll make a change (can save etag from get or head in var etag_before)
response = MoviesWS.patch("/movies/54321.json", :body => { :movie => { :title => "rocky5500", :foo => "bar"}}.to_json, :headers => { "Content-Type" => "application/json"})
etag_after = response.header["etag"]
# etag changed


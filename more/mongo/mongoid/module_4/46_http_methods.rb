# POST is for creating new resource instances
# POST to resource URI, Provide JSON payload (optional), Provide MIME type of the payload
# in the Content-Type header

MoviesWS.post("/movies.json", :body => { :movie => {:id => "54321", :title => "rocky54"}}.to_json, :headers => { "Content-Type" => "application/json"})
# without: :headers => { "Content-Type" => "application/json"} => incorrect parsing


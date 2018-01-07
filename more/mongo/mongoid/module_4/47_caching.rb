# Web caching
# Temporary storage of docs to reduce bandwith usage and server load and improve performance

# Improve percieved performance by doing less and not repeating ourselves

# Client caching
# Caching headers
# Etag
# Last-Modified
# cache-control

response = HTTParty.head("https://third-mongoid-workspace-michal8888.c9users.io/movies/54321")
pp ["cache-control", "etag", "last-modified"].map { |h| {h => response.header[h]}}

# add a tag
Movie.find("54321").cache_key
# quick digest
Digest::MD5.hexdigest(Movie.find("54321").cache_key)

Movie.find("54321").updated_at.httpdate

HTTParty.head("https://third-mongoid-workspace-michal8888.c9users.io/movies/54321.json").headers["Last-Modified"]
# returns nil
reload!

HTTParty.head("https://third-mongoid-workspace-michal8888.c9users.io/movies/54321.json").headers["Last-Modified"]


# Last-Modifed
# can control Last-Modified
Movie.find("54321").updated_at.httpdate

def show
  headers["ETag"] = Digest::MD5.hexdigest(@movie.cache_key)
  headers["Last-Modified"] => @movie.updated_at.httpdate
end

HTTParty.head("https://third-mongoid-workspace-michal8888.c9users.io/movies/54321.json").headers["Last-Modified"]


# fresh_when
# rails provides convenient methods that perform the roles discussed
def show
  # headers["ETag"] = Digest::MD5.hexdigest(@movie.cache_key)
  # headers["Last-Modified"] = @movie.updated_at.httpdate
  fresh_when(@movie)
end

response = HTTParty.head("https://third-mongoid-workspace-michal8888.c9users.io/movies/54321")
pp ["cache-control", "etag", "last-modified"].map { |h| {h => response.header[h]}}

response = HTTParty.head("https://third-mongoid-workspace-michal8888.c9users.io/movies/54321.json")
pp ["cache-control", "etag", "last-modified"].map { |h| {h => response.header[h]}}

# etag for /movies/54321 is different that etag for /movies/54321.json
# but last-modified is the same

# web caching can significantly enhance browsing expercience and reduce bandwith usage



# CACHE REVALIDATION HEADERS
# Validate if what we have is current or stale using conditional cache validation headers:
# If-Not-Match: (Etag)
# If-Modified-Since (Timestamp)

# If resource is NOT changed:
# enable server-side to do less processing cause client doesn't need new copy
# report the resource has not changed to client
# enable client-side to do less processing => nothing's changed

response = HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/movies/54321",
                        headers: {"Accept" => "application/json"})
response.response # status 200 OK
etag = reponse.header["etag"]

last_modified = response.header["last-modified"]
response = HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/movies/54321",
                        headers: {"Accept" => "application/json")
response.response # status 200 OK

response = HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/movies/54321",
                        headers: {"Accept" => "application/json",
                                  "If-None-Match" => etag})
response.response # 304 Not Modified

response = HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/movies/54321",
                        headers: {"Accept" => "application/json",
                                  "If-Modified-Since" => last_modified})
response.response # 304 Not Modified



# Conditional Logic
# fire only if the caller is not getting 304/not_modified

def show
  # fresh_when(@movie)
  @movie.movie_accesses.create(:action => "show")
  if stale?(@movie)
    @movie.movie_accesses.create(:action => "show-stale")
    # do some additional, expensive work here
  end
end

# stale? calls fresh_when undercovers


response = HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/movies/54321",
                        headers: {"Accept" => "application/json",
                                  "If-Modified-Since" => last_modified})
response.response # 304 Not Modified
pp Movie.find("54321").movie_accesses.pluck(:created_at, :action).to_a

# last_modified value is being set to the most recent change in the collection
def index
  @movies = Movie.all?
  fresh_when(last_modified: @movies.max(:updated_at))
end

# Provide both if-modified-since and if-none-match in the header
# if either fires, our conditional logic will get triggered

response = HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/movies/54321",
                        headers: {"Accept" => "application/json",
                                  "If-Modified-Since" => last_modified,
                                  "If-None-Match" => "123"})
response.response # status 200 OK
pp Movie.find("54321").movie_accesses.pluck(:created_at, :action).to_a



# Browser test

# chrome - developer tools - network(preserve logs)
# "https://third-mongoid-workspace-michal8888.c9users.io/movies/54321.json" status - 200/ok

# hit refresh (status - 304/not modified)
# # If-Modified-Since and If-None-Match headers were supplied

# click disable-cache at the top of the network tab and hit refresh
# the conditional headers are not sent to the rails server and the full response is returned using 200/ok


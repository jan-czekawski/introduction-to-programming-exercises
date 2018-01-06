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
response.response
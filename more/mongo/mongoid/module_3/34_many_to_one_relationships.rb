# belongs_to

# children are stored in separate collection from the parent (common but not necessarily)

# Child (class using foreign key) uses belongs_to and parent (optionally) uses has_many
# => without has_many => rel becomes uni-directional
# e.g. you can get to Place of residence info from Director, but not to Director from Place of residence

# multiple directors (child) can have the same place of residence (parent)

class Director
  include Mongoid::Document
  # (...)
  belongs_to :residence, class_name: "Place"
end

director = Director.where(residence: { :$exists => 0 }).first

# look for it in the db
pp Director.collection.find(:_id => director.id).first

# assign place to oakland
oakland = Place.where(:city => "Oakland").first

# assign it to director (it didn't actually save)
director.residence = oakland

# residence is still not saved
pp Director.collection.find(:_id => director.id).first

# now it's good
director.save

# Related object is now in the separate collection => director has only
# FK stored locally to that related doc

director.residence.state
# it need separate, additional query to db => have to make a call to Place
# to get associated state/city based on that id (based on that FK)


# but if you want to access only FK, just access relationship_id
director.residence_id 
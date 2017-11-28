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
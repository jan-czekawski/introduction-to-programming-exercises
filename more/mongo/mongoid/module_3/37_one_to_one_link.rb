# children are referenced in the parent doc
# parent will use macro "has_one", child will use "belongs_to"

# if you have both of them defined => rel is bidirectional

# Movie class will has has_one and belongs_to => but usually it would have 2 different collections
class Movie
  include Mongoid::Document
  field :title, type: String
  # (...)
  has_one :sequel, class_name: "Movie"
  belongs_to :sequel_to, class_name: "Movie"
  # (...)
end

# eg rocky 25 has sequel rocky 26; rocky 26 belongs_to sequel_to rocky 25
# classic example of recursive relationship

rocky25 = Movie.where(title: "Rocky XXV").first
rocky26 = Movie.where(title: "Rocky XXVI").first

# establish relationship
rocky26.sequel_to = rocky25
rocky26.save

# shows sequel_to attr
pp Movie.collection.find(title: "Rocky XXVI").first

# doesn't show it
pp Movie.collection.find(title: "Rocky XXV").first

# can use it both ways
rocky26.sequel_to.title
rocky26.sequel_to.sequel.title
class Post
  # using methods from the official mongoid docs
  include Mongoid::Document
  store_in collection: "zips", database: "zips_development"
  field :city, type: String
  field :state, type: String
  field :pop, type: Integer
end
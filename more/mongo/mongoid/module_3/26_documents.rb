# docs are core objects in Mongoid => Mongoid::Document
# docs can be stored in collection or embedded in other docs

# docs stored in collection:
class Movie
  include Mongoid::Document
end

# fields are attributes: field, type (String by default when using generator)
# rails g model (adding fields by hand without type => type "typeless")
class Movie
  field :title, type: String
  field :type, type: String
  field :rated, type: String
  field :year, type: Integer
end

# examples of rails g model (with Mongoid gem => generator uses mongoid by default)
# rails g model Movie title type rated year:integer release_date:date \
# runtime:Measurement votes:integer countries:array language:array \
# genres:array filming_locations:array metascore simple_plot:text \
# plot:text url_imdb url_poster directors:array actors:array

# rails g model Actor name birth_name date_of_birth:Date height:Measurement bio:text

# Field types (supported by Mongoid and MongoDB with ruby driver)
# Array, BigDecimal, BSON, Symbol, Boolean, Date, Range, Time, DateTime, Float,
# Regexp, TimeWithZone, Hash, Integer, String

# Timestamp info is not added by default in Mongoid (it is in AR)
# have to include mixin Mongoid::Timestamps to get created_at and updated_at fields

# .touch => will update doc's updated_at timestamp

pp Movie.find("tt0036775")

# to check timestamps we will first create new movie
rocky26 = Movie.create(:_id => "tt9000031", :title => "Rocky XXVI")

# can get timestamps
rocky26.created_at
rocky26.updated_at

# will change field to confirm that timestamps update
rocky26.year = 2017
rocky26.save

# now timestamps will be different
rocky26.created_at
rocky26.updated_at 

# touch will also change updated_at
rocky26.touch
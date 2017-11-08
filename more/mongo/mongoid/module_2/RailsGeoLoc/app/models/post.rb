class Post
  include Mongoid::Document
  store_in collection: "zips"
  field :city, type: String
  field :state, type: String
  field :pop, type: Integer
  field :longitude, type: Float
  field :latitude, type: Float

  def initialize(params={})
    super
    if params[:loc]
      @longitude = params[:loc][0]
      @latitude = params[:loc][1]
    else
      @longitude = params[:longitude]
      @latitude = params[:latitude]
    end
  end

  def near(max_miles, min_miles, limit)
    max_miles = max_miles.nil? ? 1000 : max_miles.to_i
    min_miles = min_miles.nil? ? 0 : min_miles.to_i
    limit = limit.nil? ? 5 : limit.to_i
    limit += 1 if min_miles == 0
    
    miles_to_meters = 1609.34
    min_meters = min_miles.to_i * miles_to_meters
    max_meters = max_miles.to_i * miles_to_meters
    near_posts = []
    self.class.collection.find(
        loc: { :$near => {
          :$geometry => { type: "Point", coordinates: [@longitude, @latitude]},
          :$midDistance => min_meters,
          :$maxDistance => max_meters
        }}
      ).limit(limit).each do |z|
        near_posts << Post.new(z)
      end
    near_posts
  end
end

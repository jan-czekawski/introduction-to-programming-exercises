# can define custom types in Mongoid and choose how they are
# serialized and deserialized

# 5 methods: initialize, mongoize (instance meth), mongoid, demongoize, evolve (class meth)
# example => Measurement
# :runtime => { :amount => 60, :units => "min" }

class Measurement
  attr_reader :amount, :units
  
  # also have to define to_s
  
  def initialize(amount, units = nil)
    @amount = amount
    @units = units
    
    case
    when @units == "meters"
      @amount /= 0.3048
      @units = "feet"
    end  
  end
  
  #creates a DB-form of the instance
  def mongoize
    @units ? {:amount => @amount, :units => @units} : {:amount => @amount}
  end
  
    #creates an instance of the class from the DB-form of the data
  def self.demongoize(object)
    case object
    when Hash then Measurement.new(object[:amount], object[:units])
    else nil
    end
  end

  #takes in all forms of the object and produces a DB-friendly form
  def self.mongoize(object) 
    case object
    when Measurement then object.mongoize
    else object
    end
  end

  #used by criteria to convert object to DB-friendly form
  def self.evolve(object)
    case object
    when Measurement then object.mongoize
    else object
    end
  end
  
end




# store_in

# Application type to Document type mapping
# Location gets stored in to "places" collection

# have to add it into location.rb in /models/ file
class Location
  include Mongoid::Document
  # without it, collection stored would be "locations"
  store_in collection: "places"
  field :city, type: String
  # etc
end

# in rails console
Place.count
loc = Location.create(city: "test", state: "test", country: "USA")
Place.count # => incremented

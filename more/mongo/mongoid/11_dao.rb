# in app/models add file zips.rb

class Zip
  # convenience method for access to client in console
  def self.mongo_client
    Mongoid::Clients.default
  end
  
  # convenience method for access to zips collection
  def self.collection
    self.mongo_client['zips']
  end
  
  def self.all(prototype = {}, sort = { :population=> 1 }, offset = 0, limit = 100)
    #map internal :population term to :pop document term
    tmp = {} #hash needs to stay in stable order provided
    sort.each {|k,v| 
      k = k.to_sym==:population ? :pop : k.to_sym
      tmp[k] = v  if [:city, :state, :pop].include?(k)
    }
    sort=tmp

    #convert to keys and then eliminate any properties not of interest
    prototype=prototype.symbolize_keys.slice(:city, :state) if !prototype.nil?

    Rails.logger.debug {"getting all zips, prototype=#{prototype}, sort=#{sort}, offset=#{offset}, limit=#{limit}"}

    result=collection.find(prototype)
          .projection({_id:true, city:true, state:true, pop:true})
          .sort(sort)
          .skip(offset)
    result=result.limit(limit) if !limit.nil?

    return result
  end
end

# try using:
Zip.mongo_client
Zip.mongo_client[:zips]
Zip.collection.find.count
Zip.all.count
Zip.all({ :state => "NY" }, { :population => -1 }, 0, 1).first

# there's name clash with module Zip => instead can generate new model
# eg => rails g model post; and put all the code in that model file
# instead of Zip use Post

class Post
  # convenience method for access to client in console
  def self.mongo_client
    Mongoid::Clients.default
  end
  
  # convenience method for access to zips collection
  def self.collection
    self.mongo_client['zips']
  end
  
  def self.all(prototype = {}, sort = { :population=> 1 }, offset = 0, limit = 100)
    #map internal :population term to :pop document term
    tmp = {} #hash needs to stay in stable order provided
    sort.each {|k,v| 
      k = k.to_sym==:population ? :pop : k.to_sym
      tmp[k] = v  if [:city, :state, :pop].include?(k)
    }
    sort=tmp

    #convert to keys and then eliminate any properties not of interest
    prototype=prototype.symbolize_keys.slice(:city, :state) if !prototype.nil?

    Rails.logger.debug {"getting all zips, prototype=#{prototype}, sort=#{sort}, offset=#{offset}, limit=#{limit}"}

    result=collection.find(prototype)
          .projection({_id:true, city:true, state:true, pop:true})
          .sort(sort)
          .skip(offset)
    result=result.limit(limit) if !limit.nil?

    return result
  end  
  
  # have to add this module to use find
  include Mongoid::Attributes::Dynamic
  def self.find(id)
    Rails.logger.debug { "getting zip #{id}" }
    
    doc = collection.find(:_id => id)
                    .projection({ _id: true, city: true, state: true, pop: true })
                    .first
    doc.nil? ? nil : Post.new(doc)
  end
  
  # Post.find("11226") would get the record but can't just check Post.find("11226").population,
  # can check with Post.find("11226")[:pop]
  
  # to access #population
  attr_accessor :id, :city, :state, :pop
  # and
  def population
    self.pop
  end
  # post = Post.new({:id => "000002", :city => "Dummy_City2", :state => "WY", :population => 300})  
  # OTHER METHODS (EG INITIALIZER WEREN'T DEFINED => IT CAUSED PROBLEMS)
  
  
  # initialize from both a Mongo and Web hash
  def initialize(params={})
    #switch between both internal and external views of id and population
    @id=params[:_id].nil? ? params[:id] : params[:_id]
    @city=params[:city]
    @state=params[:state]
    @population=params[:pop].nil? ? params[:population] : params[:pop]
  end
end
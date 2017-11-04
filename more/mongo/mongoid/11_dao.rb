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
  
  # update
  def update(updates)
    Rails.logger.debug { "updating #{self} with #{updates}" }
    
    updates[:pop] = updates[:population] if !updates[:population].nil?
    updates.slice(:city, :state, :pop) if !updates.nil?
    
    self.class.collection
              .find(_id: @id)
              .update_one(updates)
  end
  # to check if updated have to reload from Post to local var
  # post = Post.find("0099")
  # post.update({:population => 999, :city => "Chicago", :state => "NY"}
  # post = Post.find("0099")
  # post.to_s => to see results
  
  def destroy
    Rails.logger.debug { "destroying #{self}" }
    
    self.class.collection
              .find(_id: @id)
              .delete_one
  end
  # post = Post.find("0099")
  
  # to allow ruby objects to work with action pack; allow validation, conversion etc
  include ActiveModel::Model
  
  # check if primary key is set
  def persisted?
    !@id.nil?
  end
  
  # json marshall expects both methods
  def created_at
    nil
  end
  
  def updated_at
    nil
  end
  
  # in app/helpers/post_helper.rb
  module PostsHelper
    def toPost(value)
      # change value to a Post if not already a Post
      return value.is_a?(Post) ? value : Post.new(value)
    end
  end
  
  
  # FULL FILE SHOULD LOOK LIKE THIS: (but with Post instead of Zip)
  class Zip
  include ActiveModel::Model

  attr_accessor :id, :city, :state, :population

  def to_s
    "#{@id}: #{@city}, #{@state}, pop=#{@population}"
  end

  # initialize from both a Mongo and Web hash
  def initialize(params={})
    #switch between both internal and external views of id and population
    @id=params[:_id].nil? ? params[:id] : params[:_id]
    @city=params[:city]
    @state=params[:state]
    @population=params[:pop].nil? ? params[:population] : params[:pop]
  end

  # tell Rails whether this instance is persisted
  def persisted?
    !@id.nil?
  end
  def created_at
    nil
  end
  def updated_at
    nil
  end

  # convenience method for access to client in console
  def self.mongo_client
   Mongoid::Clients.default
  end

  # convenience method for access to zips collection
  def self.collection
   self.mongo_client['zips']
  end

  # implement a find that returns a collection of document as hashes. 
  # Use initialize(hash) to express individual documents as a class 
  # instance. 
  #   * prototype - query example for value equality
  #   * sort - hash expressing multi-term sort order
  #   * offset - document to start results
  #   * limit - number of documents to include
  def self.all(prototype={}, sort={:population=>1}, offset=0, limit=100)
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

  #implememts the will_paginate paginate method that accepts
  # page - number >= 1 expressing offset in pages
  # per_page - row limit within a single page
  # also take in some custom parameters like
  # sort - order criteria for document
  # (terms) - used as a prototype for selection
  # This method uses the all() method as its implementation
  # and returns instantiated Zip classes within a will_paginate
  # page
  def self.paginate(params)
    Rails.logger.debug("paginate(#{params})")
    page=(params[:page] ||= 1).to_i
    limit=(params[:per_page] ||= 30).to_i
    offset=(page-1)*limit
    sort=params[:sort] ||= {}

    #get the associated page of Zips -- eagerly convert doc to Zip
    zips=[]
    all(params, sort, offset, limit).each do |doc|
      zips << Zip.new(doc)
    end

    #get a count of all documents in the collection
    total=all(params, sort, 0, 1).count
    
    WillPaginate::Collection.create(page, limit, total) do |pager|
      pager.replace(zips)
    end    
  end

  # locate a specific document. Use initialize(hash) on the result to 
  # get in class instance form
  def self.find id
    Rails.logger.debug {"getting zip #{id}"}

    doc=collection.find(:_id=>id)
                  .projection({_id:true, city:true, state:true, pop:true})
                  .first
    return doc.nil? ? nil : Zip.new(doc)
  end 

  # create a new document using the current instance
  def save 
    Rails.logger.debug {"saving #{self}"}

    result=self.class.collection
              .insert_one(_id:@id, city:@city, state:@state, pop:@population)
    @id=result.inserted_id
  end

  # update the values for this instance
  def update(updates)
    Rails.logger.debug {"updating #{self} with #{updates}"}

    #map internal :population term to :pop document term
    updates[:pop]=updates[:population]  if !updates[:population].nil?
    updates.slice!(:city, :state, :pop) if !updates.nil?

    self.class.collection
              .find(_id:@id)
              .update_one(:$set=>updates)
  end

  # remove the document associated with this instance form the DB
  def destroy
    Rails.logger.debug {"destroying #{self}"}

    self.class.collection
              .find(_id:@id)
              .delete_one   
  end  
end
end
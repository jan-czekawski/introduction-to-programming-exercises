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
  end
end

# try using:
Zip.mongo_client
Zip.mongo_client[:zips]
Zip.collection.find.count
Zip.all.count
Zip.all({ :state => "NY" }, { :population => -1 }, 0, 1).first
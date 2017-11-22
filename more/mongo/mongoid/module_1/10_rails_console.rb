# rails server first, rails console then:
mongo_client = Mongoid::Clients.default
mongo_client.database.name

collection = mongo_client[:zips]
collection.count

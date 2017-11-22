#irb
require "mongo"
#(cluters with less info)
Mongo::Logger.logger.level = ::Logger::INFO 
db = Mongo::Client.new("mongodb://localhost:27017")
db = db.use("test")
db.database.name
db.database.collection_names
db[:zips].find.first
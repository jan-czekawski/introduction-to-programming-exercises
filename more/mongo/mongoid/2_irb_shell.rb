#irb
require "mongo"
Mongo::Logger.logger.level = ::Logger::INFO #(cluters with less info)
db = Mongo::Client.new("mongodb://localhost:27017")
db = db.use("test")
db.database.name
db.database.collection_names
db[:zips].find.first
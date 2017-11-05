# mlab.com
# bihone
# password

# Create new
# add all the info
# click on the new create db

# Users/Add database user
# user: admin
# password: boss88


# Tools/JSON/Import collection

# in the command line => to import collection to remote db
# mongoimport -h ds245885.mlab.com:45885 -d zips_app -c zips -u admin -p boss88 --file zips.json
# HAVE TO UPDATE MONGO TO v3+ => otherwise authentication error


# to connect to mlab using standard mongo URI:
# mongodb://admin:boss88@ds245885.mlab.com:45885/zips_app

# go to irb:
require "mongo"
Mongo::Logger.logger.level = ::Logger::INFO
require "uri" # => will return false => ok
db = Mongo::Client.new("mongodb://admin:boss88@ds245885.mlab.com:45885/zips_app")
db = db.use('zips_app')
db.database.collections
db[:zips].count


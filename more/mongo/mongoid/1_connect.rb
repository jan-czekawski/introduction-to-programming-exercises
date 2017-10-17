mongoimport --db test --collection zips --drop --file ./zips.json

./mongod

mongo
use test
db.zips.findOne()

gem update --system
gem install mongo
gem install bson_ext
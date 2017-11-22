# have to add gem to integrate google maps to your app
gem 'gmaps4rails'

# have to create 2dspher index to mongodb collection
Post.collection.indexes.create_one({ loc: Mongo::Index::GEO2DSPHERE })

# can remove it with:
Post.collection.indexes.drop_one("loc_2dsphere")
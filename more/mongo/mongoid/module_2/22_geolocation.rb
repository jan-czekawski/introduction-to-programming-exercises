# in irb

# adding 2dsphere index to mongo collection index
db[:zips].indexes.create_one({loc: Mongo::Index::GEO2DSPHERE})
# :loc contains [latitude, longitude] => OPPOSITE OF GEOJSON !!!

# find city Baltimore
db[:zips].find(city: "BALTIMORE").first

# we'll find some cities using $near, $minDistance, $maxDistance
db[:zips].find(:loc => { :$near => { :$geometry => { :type => "Point",
                                                     :coordinates => [-82.624023, 39.864452]},
                                                     :$minDistance => 10000,
                                                     :$maxDistance => 50000 }
                        }).limit(5).each { |r| pp r }

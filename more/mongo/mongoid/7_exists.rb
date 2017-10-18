# exists
db[:zips].find(:city => { :$exists => true }).projection(:_id => false).limit(3).each { |r| pp r}

# not
db[:zips].find(:pop => { "$not" => { "$gt" => 9500 }}).projection(:_id => false).limit(20).each { |r| pp r}
db[:zips].find(:pop => { :$not => { :$gt => 9500 }}).projection(:_id => false).limit(20).each { |r| pp r}

# type => check BSON types in mongodb docs (2 is string, 4 array etc)
db[:zips].find(:state => { :$type => 2 }).first

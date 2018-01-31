# sum
db[:zips].find.aggregate([{ :$group => { :_id => "$state", :populationasdfasdf => { :$sum => "$pop"}}},
                            :$limit => 500]).each { |r| pp r}

# avg
db[:zips].find.aggregate([{ :$group => { :_id => "$state", :ave_population => { :$avg => "$pop"}}},
                            :$limit => 5]).each { |r| pp r}
                            
# max
db[:zips].find.aggregate([{ :$group => { :_id => "$state", :max_zip => { :$max => "$pop"}}},
                            :$limit => 5]).each { |r| pp r}

# min
db[:zips].find.aggregate([{ :$group => { :_id => "$state", :min_zip => { :$min => "$pop"}}}
                            :$limit => 5]).each { |r| pp r}

# push
# if you find 1 city with 2 zipcodes => simply display them as array
# we push the _id => because id is actually zipcode in that db
db[:zips].find.aggregate([{ :$group => { :_id => { :city => "$city", :state => "$state"},
                                         :zips => { :$push => "$_id"}}},
                            :$limit => 15]).each { |r| pp r}
                            
# addToSet
# id = 0, zips => array of all the states (can repeat themselves)
db[:zips].find.aggregate([{:$group => {:_id => 0, :zips => { :$push => "$state"}}}]).first
# id = 0, zips => array of all states (unique)
db[:zips].find.aggregate([{:$group => {:_id => 0, :zips => { :$addToSet => "$state"}}}]).first


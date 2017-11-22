# same results
db[:zips].find({state: "DE"}).first
db[:zips].find().aggregate([{:$match => { state: "DE"}}]).first

db[:zips].find({state: "DE"}).count
db[:zips].find().aggregate([{:$match => { state: "DE"}}]).count

# connected with other operators => $match early 
db[:zips].find().aggregate([{:$match => {state: "NY"}},
                            {:$group => { _id: "$city", population: {:$sum => "$pop"}}},
                            {:$project => { _id: 0, city: "$_id", population: 1}},
                            {:$sort => { population: -1}},{:$limit => 5}]).each { |r| pp r }


# without $unwind
# it will connect all the zipcodes for ELMIRA NY to array
db[:zips].find().aggregate([{ :$match => { city: "ELMIRA" }},
                            { :$group => { _id: { city: "$city", state: "$state"},
                                           zips: { :$addToSet => "$_id"} } }
                           ]).each { |r| pp r }

# with $unwind
# will “unwind” all the zipcodes from ELIMIRA NY  (it has 3 different zipcodes) into 3 separate records
db[:zips].find().aggregate([{ :$match => { city: "ELMIRA" }},
                            { :$group => { _id: { city: "$city", state: "$state"},
                                           zips: { :$addToSet => "$_id"} } },
                            { :$unwind => "$zips"} ]).each { |r| pp r }
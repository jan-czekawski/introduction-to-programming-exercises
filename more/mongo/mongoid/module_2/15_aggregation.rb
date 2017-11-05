# SQL: SELECT COUNT(*) AS count FROM zips;
# Mongo: db[:zips].find.aggregate([{ :$group => {  :_id => 0, count:  {  :$sum => 1  }  }   }  ])

# SQL: SELECT SUM(pop) AS total FROM zips;
# Mongo: db[:zips].find.aggregate([ {:$group => { :_id => 0, total:  {  :$sum => “$pop”  }   }   ])

# db.orders.aggregate([ 
# $match stage =>    { $match: { status: “A” } },	=> give me all docs that have status “A”
# $group stage =>    { $group: { _id: “$cust_id”, total: { $sum: “$amount” } } } => group them by id, sum
# ])

# Ruby syntax:
# db[:zips].find().aggregate([  { :$match => { :state => "NY" } },
#                               { :$group => {  :_id => "NY",
#                                               :population => { :$sum => "$pop" }  }  }]
#                           ).to_a

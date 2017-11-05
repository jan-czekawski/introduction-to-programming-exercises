db[:zips].find.aggregate([{ $project: { _id: 1,
                                          city: 1,
                                          state: 1,
                                          pop: 1 }},
                            { $limit: 5 }]).each { |r| pp r }

# new syntax causes errors!!!
db[:zips].find.aggregate([{:$project=>{ :_id => 1, :city => 1, :state => 1, :pop => 1}}, {:$limit=>5}]).each { |r| pp r }

# display all four fields (_id, city, state, pop)
# <field>: 1 or  <field>: true => specifies that field is included !!!

# can add ;nil => to eliminate trailing

# no trailing; no id
db[:zips].find.aggregate([{:$project=>{ :_id => 0, :city => 1, :state => 1, :pop => 1}},
                          {:$limit=>5}]).each { |r| pp r }; nil

# toLower to change states
db[:zips].find.aggregate([{:$project=>{ :_id => 0, :state => { :$toLower => "$state"}, :pop => 1}}, {:$limit=>5}]).each { |r| pp r }

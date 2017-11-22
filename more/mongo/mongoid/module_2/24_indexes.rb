#  collection             query critieria             sort order
db.users.find( { score: { "$lt": 30 } } ).sort( { score: -1 })
# mongo will create index on the field score


# explain() method returns doc with the query plan and optionally the execution statistics
pp db[:zips].find(state: "NY").explain
# check for: Parsed Query, totalDocsExamined

# create indexes on collection
db[:zips].indexes.create_one({ state: 1 })

# stats are better after index is created
pp db[:zips].find(state: "NY").explain

# create multiple indexes
db[:zips].indexes.create_many([{key: { state: 1 }}, { key: { city: 1 }}])

# to fetch all indexes
db[:zips].indexes.each { |index| p index }

# that example creates ascending index on the field state
db[:zips].indexes.create_one({ state: 1 })

# to delete the selected id
db[:zips].indexes.drop_one("state_1")

# to delete all indexes (user created) => _id is not deleted
db[:zips].indexes.drop_all
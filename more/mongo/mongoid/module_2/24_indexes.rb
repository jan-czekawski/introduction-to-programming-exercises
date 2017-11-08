#  collection             query critieria             sort order
db.users.find( { score: { "$lt": 30 } } ).sort( { score: -1 })
# mongo will create index on the field score


# explain() method returns doc with the query plan and optionally the execution statistics
pp db[:zips].find(state: "NY").explain
# check for: Parsed Query, totalDocsExamined


# create indexes on collection
db[:zips].indexes.create_one({ state: 1 })


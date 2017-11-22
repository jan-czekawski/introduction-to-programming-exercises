# by default index is not unique, so have to specify it explicitly
db[:users].indexes.create_one({ "user_id": 1 }, { unique: true })
# next time when you try to insert same user_id, mongo will reject it

# sparse index - contains entries for docs that have the indexed field,
# even if the indexed field contains a null value
# index skips over any doc that doesn't have indexed field
# index is "sparse" because it does not include all docs in the collection
db[:users].indexes.create_one({ "user_id": 1 }, { sparse: true })
# it means => as long as doc has "user_id" let's add that doc to our little index
# in ascending order

# TTL index
# special single-field indexes that mongo can use to automatically remove docs
# from collection after a certain amount of time

# data expiration is useful for certain types of info like machine generated
# event data, logs and session info that only need to be persisted in db for
# limited time
db[:zips].indexes.create_one({ state: 1 }, { expireAfterSeconds: 3600 })
# documents are removed from the collection after 3600 seconds
# load the file
require "./gridfs_loader"

# connection to database
GridfsLoader.mongo_client

# load the file
os_file = File.open("./image2.jpg")

# create grid_fs_object
grid_file = Mongo::Grid::File.new(os_file.read)

# inspect the file
grid_file.methods
grid_file.id
grid_file.content_type
grid_file.filename # => ret's nil => we didn't provide it
grid_file.upload_date
grid_file.info # => instead of methods 1 by 1

grid_file.chunk_size
grid_file.chunks.count

pp grid_file.chunks; nil

# store it to make another object
c = GridfsLoader.mongo_client

# insert data into our database
r = c.database.fs.insert_one(grid_file)

# EXPORT FILE from GridFS
stored_file = c.database.fs.find_one(:_id => BSON::ObjectId('5a002cd57b2c270c6a01fc3d'))

# create file to store that exported data
os_file2 = File.open("./exported_copy.jpg", "w")

# copy the data from chunks to the file
stored_file.chunks.reduce([]) { |x, chunk| os_file2 << chunk.data.data }

# add description to the file
description = {}

description[:filename] = "myfile.jpg"
description[:content_type] = "image/jpeg"
description[:metadata] = { :author => "kiran", :topic => "nice spot" }

# add the description
grid_file = Mongo::Grid::File.new(os_file.read, description)
grid_file.info

# insert into db with the grid file that has all the properties
r = c.database.fs.insert_one(grid_file)

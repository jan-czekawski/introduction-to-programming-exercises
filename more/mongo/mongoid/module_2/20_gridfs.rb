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

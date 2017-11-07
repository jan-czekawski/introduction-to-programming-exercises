# OLD VERSION
# rvm install 2.2.0
# rvm use 2.2.0

# git clone https://github.com/jhu-ep-coursera/fullstack-course3-module2-gridfsfiles.git
# bundle install

# ./mongod
# rails server -p $PORT -b $IP

# in the app:
# new grid fs file
# provide the info in the form and choose image and upload

# picture it's shown in the index

# in app/views/grid_fs_files
# div class="fields" has f.file_field :contents => to read the file from the browser

# :contents is used in app/models/grid_fs_files.rb in #save
# File.new will use @contents.read to read the content

# in grid_fs_file
# in the hash it uses camelCase and in the Grid::File it uses snake_case
# to make mapping a little easier


# in #initialize, we take all the properties from the web form and use them for 
# inserted data
# if clause => if hash of information came from GridFS use it, if not (and it came)
# from Rails use rails hash => to instantiate instance variables

# #save will read the content of the object

# #contents => to show that data was successfully uploaded it will go and find_one
# and basically return data to the browser
# array of the chunks is fetched into to the single variable => buffer


# #destroy => will delete file from the db, based on the id


# add another image in the app => create grid fs file

# in rails console:
GridFsFile.mongo_client.database.fs.find.first[:_id].to_s

# assign that file to an object
f = GridFsFile.find("5a0080af7b2c27786f000001")
pp f

# can delete it
f.destroy
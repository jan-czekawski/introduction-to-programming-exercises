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
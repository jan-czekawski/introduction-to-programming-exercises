# have to update config/mongoid.yml file
# add production branch:
# production:
#   clients:
#     default:
#       uri: mongodb://admin:boss88@ds245885.mlab.com:45885/zips_app
#       options:
#         connect_timeout: 15

# can use ENV variables in uri: <%= ENV['MONGOLAB_URI'] %>

# go to root folder of the rails app

# bundle install
# git init
# git add .
# git commit -am "heroku deployment"
# git remote -v
# heroku create michal8888-zips
# heroku config:add MONGOLAB_URI=mongodb...  => same with dbuser and dbpassword

# errors => heroku run rails console --trace


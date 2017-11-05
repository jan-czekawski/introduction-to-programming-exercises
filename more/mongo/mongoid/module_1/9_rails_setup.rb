rails new zips

# to Gemfile
gem 'mongoid', '~> 5.0.0'

rails g mongoid:config

# content of db => mongoid.yml

mongoimport --db zips_development --collection zips --file zips.json

rails s
rails c

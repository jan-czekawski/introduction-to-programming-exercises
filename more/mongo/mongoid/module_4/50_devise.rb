# Devise
# popular authentication solution for Rails apps

# full-featured authentication solution which handles all of the controller logic
# and form views for you

# add gem into gemfile
gem 'devise', '~> 3.5', '>= 3.5.3'

# generate devise configuration file
rails g devise:install

# configuration - url
# Define a URL for generated email messages to reference back to the server
# config/environments/development.rb

# devise options
config.action_mailer.default_url_options = { host: 'https://third-mongoid-workspace-michal8888.c9users.io/',
                                             port: 8080 }

# until action mailer is set up, all the emails will be written in server logs
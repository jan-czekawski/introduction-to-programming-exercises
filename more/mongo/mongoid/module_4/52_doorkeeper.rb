# Doorkeeper is OAuth 2 provider for Rails
# - built on top of Rails engines (easy to integrate with rails apps)
# - so far it supports all protocol flows (eg. authorization code flow,
# implicit grant, refresh token, access token, scope, client credentials etc)

# check OAuth 2 specs

# have to add 3 gems to gemfile
gem 'doorkeeper', '~> 3.1'
gem 'doorkeeper-mongodb', github: 'doorkeeper-gem/doorkeeper-mongodb'
gem 'oauth2', '~> 1.0'
# bundle install

# have to install doorkeeper
# rails g doorkeeper:install

# it adds following URI -> adds the line in routes.rb file
use_doorkeeper
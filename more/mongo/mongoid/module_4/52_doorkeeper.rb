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

# doorkeeper db config
# configure ORM and prepare the db (change from ActiveRecord to Mongoid)
# in config/initializers/doorkeeper.rb
# orm :active_record
# orm :mongoid5

# we're using mongoid -> have to install indexes
# rake db:mongoid:create_indexes

# in config/initializers/doorkeeper.rb have to update
# resource_owner_authenticator block

# FROM
# This block will be called to check whether the resource owner is authenticated or not.
# (it will get called when doorkeeper needs to locate user associated with the current session)
resource_owner_authenticator do
  fail "Please configure doorkeeper resource_owner_authenticator block located in #{__FILE__}"
  # Put your resource owner authentication logic here.
  # Example implementation:
  #   User.find_by_id(session[:user_id]) || redirect_to(new_user_session_url)
end

# TO
# This block will be called to check whether the resource owner is authenticated or not.
# (it will get called when doorkeeper needs to locate user associated with the current session)
resource_owner_authenticator do
  # fail "Please configure doorkeeper resource_owner_authenticator block located in #{__FILE__}"
  # Put your resource owner authentication logic here.
  # Example implementation:
  #   User.find_by_id(session[:user_id]) || redirect_to(new_user_session_url)
  
  # this code basically checks if we have a session or we need to find a user
  user_key = session["warden.user.user.key"]
  user_id = user_key[0][0] if user_key
  User.where(:id => user_id).first || redirect_to(new_user_session_url)
end

# Device
# - is used to manage all the users
# - it keeps user_id in the session variable called warden.user.user.key
# - user_id is within nested array when there's current user (when user is logged in)
# - doorkeeper wants to run alternate code if there's no current user => find and
# find_by user_id (either would throw exception if there was no current user)

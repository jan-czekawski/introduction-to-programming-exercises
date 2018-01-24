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


# go to login page and logout
# go to /oauth/authorize/123

# URI kicked in the resource_owner_authenticator and it will take you back
# to the login page because redirect was run and the user was not found

# log in and again attempt to go to /oauth/authorize/123
# we're successfully signed in (with authorization code 123)


# Integrating Authentication
# setup registration between acme.com (Movie Editor App) and Movie Service and OAuth
# provider (embedded in Movie Service)

# MovieEditor (acme.com) -> signup for new account
# go to /oauth/applications/new (have to be logged in)

# name - Movie Client
# redirect url - https://acme.com/auth/movies/callback

# click SUBMIT

# it displays: Application ID, secret password, callback url (that we've sent)
# we have to store that info (we'll need it to authorize url request)

# Application Id:
# c9bf0fbdd6dbfb2ad4d51e8d8c1d6907e54e011bf4504a7d2da117051c3afdca

# Secret:
# 16ad972423d91396c2111d34cb426e5d2f06ea3cdb303678ac10f793d0b96445

# Scopes:

# Callback urls:
# http://acme.com/auth/movies/callback

# from rails console
app_id = "c9bf0fbdd6dbfb2ad4d51e8d8c1d6907e54e011bf4504a7d2da117051c3afdca"
secret = "16ad972423d91396c2111d34cb426e5d2f06ea3cdb303678ac10f793d0b96445"
callback = "http://acme.com/auth/movies/callback"
client = OAuth2::Client.new(app_id, secret, site: "https://third-mongoid-workspace-michal8888.c9users.io/")

# send authorize url request
client.auth_code.authorize_url(redirect_uri: callback)
# we got
# https://third-mongoid-workspace-michal8888.c9users.io/oauth/authorize?client_id=c9bf0fbdd6dbfb2ad4d51e8d8c1d6907e54e011bf4504a7d2da117051c3afdca&redirect_url=https%3A%2F%2Facme.com%2Fauth%2Fmovies%2Fcallback&response_type=code

# and after pasting in the browser, we should get redirected to callback url
# first time we could get sign in page (if not logged in), then log in and paste
# it in the browser again => we should get authorization code page

# will get Authorization required page and will have to confirm if we want to authorize
# we got redirect to non-existing page, but it has code in the query (after "?")
# we'll use it for access token


# I wasn't able to get it this way (got error after pasting in the browser),
# but I could just click "Authorize" after I've created Movie Client app in the /oauth/applications/new
code = "905a4eb6e9c30b9d8046d9446ef6f060d5ba06c2bf6e4fa40ad6ab231224a22c"

access = client.auth_code.get_token(code, redirect_uri: callback)
# !!! I got error => it has to be 1st try of authorization and in the client you have to
# !!! provide site with "/" at the end and in #authorize_url and #get_token use redirect_uri (I not L) as argument

access.token
# we should get the token

# ANOTHER TRY
# new application /oauth/applications/new
# name - Checkers
# callback - https://acme.com/auth/movies/callback
app_id = "df5a0e7386bf3262a845b8daa36aa792a42a848cda7ae9fa5dabb44716477ad2"
secret = "53830b57c92acb4edd416bd3eb0c6293aa2e65ee96beac7d55f1ecb5c220343c"
callback = "https://acme.com/auth/movies/callback"
client = OAuth2::Client.new(app_id, secret, site: "https://third-mongoid-workspace-michal8888.c9users.io/")
client.auth_code.authorize_url(redirect_uri: callback)
# got this link
# https://third-mongoid-workspace-michal8888.c9users.io/oauth/authorize?client_id=df5a0e7386bf3262a845b8daa36aa792a42a848cda7ae9fa5dabb44716477ad2&redirect_uri=https%3A%2F%2Facme.com%2Fauth%2Fmovies%2Fcallback&response_type=code

# paste it into browser, click "Authorize", copy code from the query from redirected page
code = "43f1a2d0a22395644d965d3330c05f48bc79891babb03ba32e92528e487a1e6e"
access = client.auth_code.get_token(code, redirect_uri: callback)
# OK

access.token
# "c092780a967f90cca49e8af18730994659365035356c6b6856ebd320cd628e27" 


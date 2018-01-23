# PROBLEM
# if you go to
# https://third-mongoid-workspace-michal8888.c9users.io/movies/54321/edit
# (movie with that id has to exist in the db) you can easily edit the movie (you're logged out!!)

# to help with that!
# integrate sign-in and authentication

# PagesController (write actions)
# will add before_actions in pages controller and have all the HTML based controller extend base controller
class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :user_signed_in?, except: [:index, :show]
  
  def index
  end
end

class MoviesController < PagesController
end

# now try to go to
# https://third-mongoid-workspace-michal8888.c9users.io/movies/54321/edit
# won't allow that if not logged in (will redirect to login page)

# now go to login page and login
# and now can access edit/delete

# Webpages are blocked of by devise, now we'll do it for API
# API Base Controller
module Api
  class BaseController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :user_signed_in?, except: [:index, :show]
    # before_action :doorkeper_authorize!, except: [:index, :show]
    protect_from_forgery with: :null_session
    respond_to :json
  end
end

# check if access available to non-writable methods in API controller

# index
response = HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/api/movies")
# status 200 OK

response.response
pp JSON.parse(response.body)

# can get specific resource (show)
response = HTTParty.get("https://third-mongoid-workspace-michal8888.c9users.io/api/movies/54321")
# status 200 OK

response.response
pp JSON.parse(response.body)


# now try write methods
response = HTTParty.post("https://third-mongoid-workspace-michal8888.c9users.io/api/movies",
                         :body => { :movie => { :id => "54321", :title => "rocky25" }})
# you'd get error message

response.response
# HTTPUnauthorized 401

# we got 401, but there was no redirection to signup page (like in html) => devise has
# some of the methods redirected automatically

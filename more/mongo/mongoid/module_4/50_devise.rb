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

# User Model Class
# holds accounts in your service -> what someone is validated when authenticating
# through standard mean (login etc)

# rails g devise user => will create model class
# could use different user name (eg admin => rails g devise admin)

# snippet
class User
  include Mongoid::Document
  
  devise :database_authenticable, :registrable, :recoverable,
         :rememberable, :trackable, :validatable
         
  field :email, type: String, default: ""
  field :encrypted_password, type: String, default: ""

  # ...
end

# confirmable and lockable are disabled by default


# Devise management
# Devise manages three (3) primary resources for our user:
# login sessions - login/logout
# passwords, and
# registration data - email, optional fields

# update index.html.erb => adding simple set of links to establish login/logout/signup
# <% if user_signed_in? %>
#   <h2>Logged in as: <%= current_user.email %></h2>
#   <ul>
#     <li><%= link_to 'Log out', destroy_user_session_path, method: :delete %></li>
#     <li><%= link_to 'Profile', edit_user_registration_path %></li>
#   </ul>
# <% else %>
#   <h2>Welcome!</h2>
#   <ul>
#     <li><%= link_to 'Log in', new_user_session_path %></li>
#     <li><%= link_to 'Sign up', new_user_registration_path %></li>
#   </ul>
# <% end %>

# start the server
# click on sign up
# create new user
# harry@hogwarts.com
# password

# in rails console

# User.mongo_client.database.collection_names
# movies, users

# User.collection.name
# users

# pp User.first.attributes
# rails _4.2.0_ new app_name => to pick rails version
# rails new MyApp -T -d postgresql (-T => skip minitest; -d => choose db)
# rails (app) new MyApp --skip-active-record
# rakeroutes -c static-pages (will show only routes for static_pages controller)

# can use scoping to organize your routes => scope by module; by path, by controller, shallow nesting
# scope in path
scope "admin" do
  resources "employees"
end

# scope in module => in route (another directory)
scope module: :admin do
  resources "employees"
end

# as: :admin => adds "admin" to the prefix => can use that method
scope "admin", module: :admin, as: :admin do
  resources "employees"
end

# SAME RESULT WITH "NAMESPACE"
namespace "admin" do
  resources "employees"
end

scope controller: :management do
  get "dashboard"
  get "performance"
end

# shallow routes => to avoid unecessary nesting

# will add "sekret" to the prefix (can be used for the path_method)
scope shallow_prefix: "sekret" do
  resources :articles do
    resources :comments#, shallow: true
  end
end

# will add "sekret" to the path
scope shallow_path: "sekret" do
  resources :articles do
    resources :comments#, shallow: true
  end
end

resources :auctions, shallow: true do
  resources :bids do
    resources :comments
  end
end

# constraints => can filter what routes are available using
# constraints: segment constraints; request based constraints; advanced constraints
constraints(ip: /127\.0\.0\.1$/) do
  get 'route', to: "controller#action"
end

# concerns => used to avoid repetition in nested routes
concern :commentable do
  resources :comments
end

resources :pages, concerns: :commentable

# for concerns to be meaningful there must be multiple resources that utilize the concern
resources :posts, concerns: %i(commentable)
resources :blogs do
  concerns :commentable
end

# can add route page path with "root" method
root "application#index"
same as: get "/", to: "application#index"

# can split route file into multiple files (if it's too big) and use
# require_relative to import it to main file

# make directory in config => and in config/routes/admin_routes.rb
AppName::Application.routes.draw do
# Rails.application.routes.draw do => same result
  namespace :api do
    resources :posts
  end
end

# additional RESTful actions
resources :photos do
  member do
    get "preview"
  end
  
  collection do
    get "dashboard"
  end
end
# would create resources and 2 additional GET routes "photos/:id/preview" and
# "photos/dashboard"

# can do it in 1 line
resources :photos do
  get "preview", on: :member
  get "dashboard", on: :collection
end

# can also add an action to the "new" path
resources :photos do
  get "preview", on: :new
end

# BUT WHEN ADDING ACTIONS TO YOUR RESTFUL ROUTES => YOU MIGHT MISS ANOTHER
# RESOURCE

# defining a member block inside a resource creates a route that can act on an individual
# member of that resource-based route
# "photos/:id/preview"

# collection routes allow for creating routes that can act on a collection of
# resource objects
# "photos/dashboard"


# mount another app
# "mount" can be used to mount another app (basically rack app) or rails engines
# to be used within current app

mount SomeRackApp, at: "some_route"
# can access that mounted app by using route helper "some_rack_app_path/url"

mount SomeRackApp, at: "some_route", as: :myapp
# can rename it and generate "my_app_path/url" helpers
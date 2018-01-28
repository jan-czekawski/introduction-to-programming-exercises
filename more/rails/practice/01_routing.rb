# rails _4.2.0_ new app_name => to pick rails version
# rails new MyApp -T -d postgresql (-T => skip minitest; -d => choose db)
# rails (app) new MyApp --skip-active-record
# rakeroutes -c static-pages (will show only routes for static_pages controller)

# can use scoping to organize your routes => scope by module; by path, by controller, shallow nesting


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
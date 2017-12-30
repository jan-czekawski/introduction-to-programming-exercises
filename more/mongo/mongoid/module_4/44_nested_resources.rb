rails g scaffold_controller MovieRole character actor_id

# have to register movie_roles resources nested in movies
Rails.application.routes.draw do
  resources :movies do
    resources :movie_roles, as: :role, path: "roles"
    # as: :role => to have routes more clear
  end
  resources :actors
end

# in controllers/movie_roles_controller.rb
before_action :set_movie_role, only: [:show, :edit, :update, :destroy]

def show
end

  def set_movie_role
    @movie_role = Movie.find(params[:movie_id]).roles.find_by(:id => params[:id])
  end
  
  
# JSON Marshaller 
# default json marshaller expects timestamp
# app/views/movie_roles/show.json.builder
json.extract! @movie_role, :id, :character, :actor_id, :created_at, :updated_at

# remove field for display
json.extract! @movie_role, :id, :character, :actor_id
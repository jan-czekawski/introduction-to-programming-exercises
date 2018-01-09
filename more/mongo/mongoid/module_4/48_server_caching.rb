# Server caching
# focus is on the server - how to make it efficient
# various types of caching on the server side
# can be turned on or off - globally

# config/environments/development.rb
config.action_controller.perform_caching = true

# TYPES
# rails severals levels of caching:
# page caching; action caching; fragment caching;
# low level caching

# Page cache
# writes static files to directory; lazily updates files only when accessed;
# invaldiates/removes files on events like updates; directory cleared of stale content using sweeper

# Web server
# serves a public single URI; looks for content first in static content directory;
# makes request to rails server if static content is missing

# Page caching - properties
# fast - pre-rendered views being served
# good for - dynamic content that stays stable for periods of time; content served without regard to caller

# not appropriate for: content that varies per user (eg. login, preferences); content that is very dynamic
# separate gem - Gemfile: gem 'actionpack-page_caching'


# Caching setup
# Turn on caching
# config/environments/development.rb
config.action_controller.perform_caching = true
config.action_controller.page_cache_directory = "#{Rails.root.to_s}/public/page_cache"

# Add caches_page
class MoviePagesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  caches_page :index, :show
end

# Caching setup - expiration
# page expiration
def update
  respond_to do |format|
    if @movie.update(movie_params)
      expire_page action: "show", id: @movie, format: request.format.symbol
      expire_page action: "index", format: request.format.symbol
    end
  end
end

def destroy
  @movie.movie_acesses.create(:action => "destroy")
  @movie.destroy
  expire_page action: "show", id: @movie, format: request.format.symbol
  expire_page action: "index", format: request.format.symbol
end

# caches folder
# The rendered content is written to files in the public directory based on the URI
# result of calling index and show methods
# public/page_cache
# -- movie_pages
#   `--12345.json
# `-- movie_pages.json
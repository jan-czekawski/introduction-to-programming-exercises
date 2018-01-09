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


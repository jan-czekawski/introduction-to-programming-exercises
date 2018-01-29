# partial templates(partials) break rendering process into more managable chunks
# they allow you to extract piece of code into separate file and reuse them
# in multiple files

# to create partial => file has to begin with underscore => _form.rb

# to render it as part of view:
<%= render "form" %>

# can pass variable when rendering partial
<%= render :partial => "form", locals: { post: @post } %>
# <%= render partial: "form", locals: { post: @post } %>

# object partials

# objects that respond to #to_partial_path can also be rendered
<%= render @post %>
# by default for ActiveRecord models it will be sth like posts/post, 
# so by rendering @post, the file views/posts/_post.html.erb will be rendered
# and local var named "post" will be automatically assigned

<%= render @post %> # is short for
<%= render "posts/post", post: @post %>

# collection of objects that respond to #to_partial_path (like @posts) can also
# be rendered this way => each item will be rendered consecutively

# global partial => can be used anywhere (without referencing its exact path),
# has to be located in views/application/
# app/views/application/_html_header.html.erb
<%= render "html_header" %>


# AssetTagHelper
# can let rails automatically (and correctly) link assets (css/js/img) best
# to use helpers (in most cases)

# image helpers
image_path("edit.png") # /assets/edit.png
image_url("edit.png") # http://www.example.com/assets/edit.png
image_tag("icon.png") # <img src="/assets/icon.png" alt="Icon"/>

# js helpers
javascript_include_tag "application" # <script src="/assets/application.js"></script>
javascript_path "application" # /assets/application.js
javascript_url "application" # http://www.example.com/assets/application.js

# stylesheet helpers
stylesheet_link_tag "application" # <link href="assets/application.css" media="screen" rel="stylesheet"/>
stylesheet_path "application" # /assets/application.css
stylesheet_url "application" # http://www.example.com/assets/application.css

# replace html code in views => can print html content at runtime
content_for

<% content_for :header do %>
  <ul>
    <li>Line item 1</li>
    <li>Line item 2</li>
  </ul>
<% end %>

<div>
  <%= yield :header %>
</div
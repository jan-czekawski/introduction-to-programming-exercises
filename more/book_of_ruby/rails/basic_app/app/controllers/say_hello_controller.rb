class SayHelloController < ApplicationController
  def show_family(some_class, msg)
    if !some_class.nil?
      msg += "<li>#{some_class}</li>"
      show_family(some_class.superclass, msg)
    else
      msg
    end
  end
  
  def index
    @heading = "<h1>This is the controller's class hierarchy</h1>".html_safe
    @class_hierarchy = "<ul>#{show_family(self.class, "")}</ul>".html_safe
  end
end

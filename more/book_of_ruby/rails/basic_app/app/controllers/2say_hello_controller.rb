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
    @class_hierarchy = "<ul>#{show_family(self.class, "")}</ul>".html_safe
  end
end

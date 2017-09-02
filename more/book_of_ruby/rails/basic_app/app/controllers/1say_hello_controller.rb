class SayHelloController < ApplicationController
  # def index
      
  # end
  
  # def bye

  # end
  
  def show_family(some_class, msg)
    if !some_class.nil?
      msg += "<br />#{some_class}"
      show_family(some_class.superclass, msg)
    else
      render plain: msg
    end
  end
  
  def index
    show_family(self.class, "Class hierarchy of self...")
  end
end

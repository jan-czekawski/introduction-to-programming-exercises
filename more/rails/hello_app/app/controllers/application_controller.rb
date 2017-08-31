class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    # render html: "hello world!"
    # render html: "holla mundo!"
    render html: "¡Hola, mundo!"
  end
  
  def goodbye
    render html: "goodbye, world!"
  end
end

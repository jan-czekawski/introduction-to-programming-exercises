class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  # TODO: check if can be inside users_controller with other methods
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  
  # helper_method :full_title

  # def full_title(page_title = "")
  #   base_title = "Ruby on Rails Tutorial Sample App"
  #   if page_title.empty?
  #     base_title
  #   else
  #     page_title + " | " + base_title
  #   end
  # end


  def hello
    render html: "hello, world!"
  end
end

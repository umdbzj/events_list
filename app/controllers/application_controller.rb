class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def hello
  	render html: "This will be the events list app!"
  end
  
  private
  
# confirmed that there is a logged-in user
  def logged_in_user
  	unless logged_in?
  		store_location
  		flash[:danger] = "Please log in"
  		redirect_to login_url
  	end
  end
  
end

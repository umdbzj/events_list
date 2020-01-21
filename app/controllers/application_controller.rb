class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def hello
  	render html: "This will be the events list app!"
  end
  
end

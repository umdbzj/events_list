class SessionsController < ApplicationController
  def new
  end
  
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# log in and redirect to user's show page
  	else
  		# error message and go to the new user page
  		flash.now[:danger] = 'Invalid email/password combination'  
  		render 'new'
  	end
  end
  
  def destroy
  end
end

module SessionsHelper

	#logs in the given user
	def log_in(user)
		session[:user_id] = user.id
	end
	
	#returns the current logged-in user, if any
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end
	
	#returns true if the user is logged in and false otherwise
	def logged_in?
		!current_user.nil?
	end
	
	# log out the current user
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end
	
	# Returns true if the given user is the current user
	def current_user?(user)
		user == current_user
	end
	
	# redirects to the stored location or to the default URL
	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end
	
	# Stores the URL that was trying to be accessed
	def store_location
		session[:forwarding_url] = request.original_url if request.get?
	end
	
end

class ApplicationController < ActionController::Base

	helper_method :current_user

	def current_user
		# debugger
		if session[:user_id]
		   @current_user = User.find(session[:user_id])
		end
	end

	def log_in(user)
		# debugger
		session[:user_id] = user.id
		@current_user = user
		redirect_to root_path, notice: "Logged in successfully."
	end

	# def logged_in?
	# 	debugger
	# 	!current_user.nil?
	# end

	private

    def logged_in?
      !session[:user_id].nil?
    end

    def log_out
    	debugger
    	session.delete(:user_id)
    	@current_user = nil
    end

end




class SessionsController < ApplicationController
	def create
     debugger
      user = User.find_by(username: params[:session][:username])
        if user
          log_in(user)
		else
        redirect_to new_session_path, alert: "Invalid username."
        end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_path
	end
end
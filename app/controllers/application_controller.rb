class ApplicationController < ActionController::Base
	before_action :set_current_user

	def set_current_user
		session_id = session[:user_id]
		if session_id
			Current.user = User.find_by(id: session_id)
			Rails.logger.info Current.user
		end
	end

	def require_user_logged_in!
		if Current.user.nil?
			redirect_to login_path, notice: "You need to sign in "
		end
	end
end

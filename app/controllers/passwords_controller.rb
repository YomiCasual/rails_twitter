class PasswordsController < ApplicationController
	before_action :require_user_logged_in!

	def edit
	end

	def edit_password
		if Current.user.update(edit_password_params)
			redirect_to root_path, notice: "Password edited successfully"
		else
			render :edit
		end
	end

	def edit_password_params
		params.require(:user).permit(:password, :password_confirmation)
	end
end
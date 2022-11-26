class RegistrationsController < ApplicationController
	def new
		@user = User.new
	end

	def login
		@user = User.new
	end

	def login_user
		selected_user = User.find_by(email: login_params[:email])
		if selected_user && selected_user.authenticate(login_params[:password])
			session[:user_id] = selected_user.id
			redirect_to root_path, notice: "Logged in successfully"
		else
			flash[:notice] = "Error login in user"
			redirect_to :login
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_path, notice: "Successfully create user"
		else
			flash[:notice] = "Error saving user"
			render :new
		end
	end

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

	def login_params
		params.require(:user).permit(:email, :password, )
	end
end

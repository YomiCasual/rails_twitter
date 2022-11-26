class OmniauthCallbacksController < ApplicationController
	before_action :require_user_logged_in!

	def twitter

		oa = omniauth_params.info
		Rails.logger.info oa
		oa_credentials = omniauth_params.credentials
		new_user = Current.user.twitter_accounts.where(username: oa.nickname).first_or_initialize
		new_user.update(
			name: oa.name,
			username: oa.nickname,
			image: oa.image,
			token: oa_credentials.token,
			secret: oa_credentials.secret,
		)
		if new_user
			redirect_to twitter_index_path, notice: "Twitter account successfully linked"
		else
			redirect_to root_path, notice: "Error connecting to twitter account"
		end
	end

	def omniauth_params
		request.env['omniauth.auth']
	end
end
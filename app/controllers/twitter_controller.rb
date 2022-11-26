class TwitterController < ApplicationController
	before_action :require_user_logged_in!
	before_action :set_current_tweet_account, only: [:destroy]

	def index
		@twitter_accounts = Current.user.twitter_accounts
	end
	def destroy
		if @twitter_account.destroy
			redirect_to twitter_index_path, notice: "Successfully deleted twitter account"
		else
			render :index
		end
	end

	private
	 def set_current_tweet_account
		@twitter_account = Current.user.twitter_accounts.find( params[:id])
	 end
end
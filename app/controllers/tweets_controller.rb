class TweetsController < ApplicationController
	before_action :require_user_logged_in!
	before_action :set_user_tweets, only: [:index, :new, :create, :destroy]

	def index
	end

	def new
		@tweet = Tweet.new
	end
	def create
		@tweet = Current.user.tweets.new(create_tweet_params)

		if @tweet.save
			redirect_to tweets_path, notice: "Tweet scheduled successfully"
		else
			render :new
		end

	end

	def destroy
		tweet = @user_tweets.find(params[:id])
		if tweet.destroy
			redirect_to tweets_path, notice: "Tweet deleted successfully"
		else
			redirect_to tweets_path, notice: "Error deleting tweet"
		end
	end

	def create_tweet_params
		params.require(:tweet).permit(:twitter_account_id, :body, :published_at)
	end


	private 
	def set_user_tweets
		@user_tweets = Current.user.tweets
		@twitter_accounts = Current.user.twitter_accounts
	end
end
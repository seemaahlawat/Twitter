class TweetsController < ApplicationController

	before_action :confirm_logged_in 
	layout 'front'

	def new
	end
	
	def show
		@tweets = Tweet.all #find(params[:id])
		@cnt = @tweets.count
	end

	def create
		@user = current_user
		@tweet = Tweet.new(tweet_params)
		flash[:error] = "Please check your tweet....!!!!" unless @tweet.save
		respond_to do |format|
    	format.js 
    	format.html {redirect_to tweet_index_path }
    end
	end

	def destroy
		@tweet = Tweet.find(params[:id]).destroy
		respond_to do |format|
    		format.js 
    		format.html
    	end
	end

	def user_tweet
		@tweet = Tweet.new
		@user = current_user
		@users = @user.followeds 
		@tweets = []#@user.tweets.order("created_at DESC")
		@users.each do |x|
			@tweets.concat(x.tweets)
		end
		render 'index'
	end

	private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id, :like, :parent_id)
  end

end

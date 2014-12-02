class TweetsController < ApplicationController

	before_action :confirm_logged_in 
	layout 'front'

	def index
    @tweets = Tweet.all.order("created_at DESC")
    @tweet = Tweet.new
    @user = current_user
	end

	def new
	end
	
	def show
	end

	def create
		@user = current_user
		@tweet = Tweet.new(tweet_params)
		flash[:error] = "Please check your tweet....!!!!" unless @tweet.save
		respond_to do |format|
    	format.js 
    	format.html 
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
		render 'show'
	end

	def like_tweet()
		@tweet = Tweet.find(params[:id])
		@tweet.like = (@tweet.like || 0) + 1
		redirect_to user_tweet_path if @tweet.save
	end

	private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id, :like, :parent_id)
  end

end

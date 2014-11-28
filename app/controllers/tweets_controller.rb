class TweetsController < ApplicationController

	before_action :confirm_logged_in 

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
		@tweet = Tweet.new(tweet_params)
			if @tweet.save
			else
				flash[:error] = "Please check your tweet....!!!!" 
			end
			respond_to do |format|
    		format.js 
    		format.html
    	end
	end

	def destroy
		tweet = Tweet.find(params[:id]).destroy
		redirect_to(:action => 'index')
	end

	def user_tweet
		@user = current_user
		@users = @user.followeds 
		 @tweets = []
		@users.each do |x|
			@tweets.concat(x.tweets)
		end
		render 'show'
	end

	def like_tweet(id)
		@tweet = Tweet.find(id)
		debugger
		@tweet.like += 1
		@tweet.save
		render 'index'
	end

	private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id, :like, :reply)
  end

end

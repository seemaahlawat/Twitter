class LikeTweetsController < ApplicationController

	layout 'front'
	def create
		@like = LikeTweet.new
		@like.user_id = current_user.id
		@like.tweet_id = 

		if @like.save
			respond_to do |format|
				format.html
				format.js
			end
		else
			flash[:error] = "Can't Like"
		end
	end

	def destroy
    @like = LikeTweet.find(params[:id])
    @like.destroy
    redirect_to user_path params[:id]
	end

	def like_tweet
		LikeTweet.create user_id: current_user.id, tweet_id: params[:id]
		redirect_to tweet_index_path
	end

	def unlike
		@like = LikeTweet.find_by_tweet_id(params[:id])
		@like.destroy
		redirect_to tweet_index_path
	end
	
	private
	def liketweet_params
		params.require(:tweetlike).permit(:user_id, :tweet_id)
	end
end
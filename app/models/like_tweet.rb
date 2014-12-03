class LikeTweet < ActiveRecord::Base

	belongs_to :user
	belongs_to :tweet
	belongs_to :liked_tweets, class_name: 'Tweet', foreign_key: 'tweet_id'

end

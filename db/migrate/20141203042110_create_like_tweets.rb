class CreateLikeTweets < ActiveRecord::Migration
  def change
    create_table :like_tweets do |t|
      t.integer :user_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end

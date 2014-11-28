class AddColumnToTweets < ActiveRecord::Migration
  def change
  	add_column :tweets, :like, :integer
  	add_column :tweets, :reply, :integer  	
  end
end

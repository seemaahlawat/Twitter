class Relationship < ActiveRecord::Base
	
	# belongs_to :follower_relationships
	# belongs_to :followed_relationships
	belongs_to :followeds, class_name: 'User', foreign_key: "followed_id"
	belongs_to :followers, class_name: 'User', foreign_key: "follower_id"
	
end

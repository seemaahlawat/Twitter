class Tweet < ActiveRecord::Base
	# default_scope order: 'createdat DESC'
	belongs_to :user
	has_many :comments, class_name: 'Tweet', foreign_key: 'parent_id'

	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 140 }
	
end

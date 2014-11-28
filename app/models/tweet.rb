class Tweet < ActiveRecord::Base
	# default_scope order: 'createdat DESC'
	belongs_to :user

	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 140 }
	
end

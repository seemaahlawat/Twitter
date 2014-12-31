class User < ActiveRecord::Base
	
	# has_secure_password

	has_many :tweets, -> { where parent_id: nil}
	has_many :like_tweets
	has_many :liked_tweets, through: :like_tweets
	

	has_many :followed_relationships, class_name: "Relationship", foreign_key: "follower_id"
	has_many :follower_relationships, class_name: "Relationship", foreign_key: "followed_id"

	has_many :followeds, through: :followed_relationships
	has_many :followers, through: :follower_relationships

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	  validates :name, presence: true
		validates :username, uniqueness: true, presence: true
		validates :email, uniqueness: true, presence: true, :format => EMAIL_REGEX
 	# validates :password, length: { minimum: 6 }

	def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
	    user.password = auth["info"]["password"]
	    user.email = auth["info"]["email"]
	    @username = user.name.split(' ').join('.')
	    user.username = @username
	  end
	end

	def self.search(search)
  	condition = "%" + search + "%"
  	where('name LIKE ?', condition)
 	end
  
  def following?(obj)
    self.followeds.include?(obj)
  end

  def already_like?(obj)
    self.liked_tweets.include?(obj)
  end

end

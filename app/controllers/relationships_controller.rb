class RelationshipsController < ApplicationController
	
	def create
	  @relationship = Relationship.new
	  @relationship.followed_id = params[:id]
	  @relationship.follower_id = current_user.id
	 
	  if @relationship.save
	    respond_to do |format|
				format.html { redirect_to @user }
				format.js
			end
	  else
	    flash[:error] = "Couldn't Follow"
	  end
	end

	def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to user_path params[:id]
	end

	def follow
		@followed = User.find(params[:id])
		current_user.followeds << @followed
	  # Relationship.create follower_id: current_user.id, followed_id: params[:id]
	end

	def unfollow
		@relationship = Relationship.find_by_followed_id(params[:id])
    @relationship.destroy
	end

	
end

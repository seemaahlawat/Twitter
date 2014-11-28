class UsersController < ApplicationController

  layout 'front'
	before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout, :new, :create]
  
	def new
    @user = User.new
	end

	def create
  	@user = User.create(user_params)
   	if @user.save
   		flash[:notice] = "Successfully registerd"
    	redirect_to(:action => 'login')
  	else
    	render 'new'
  	end
	end

	def login
  end

	def attempt_login
		if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user  
          authorized_user = found_user.authenticate(params[:password])
      end  
  	end
    if authorized_user
        session[:user_id] = authorized_user.id
	      session[:username] = authorized_user.username
	      flash[:notice] = "you are now logged in."
	      redirect_to(:action => 'show' , :id => authorized_user.id)
    else
      flash[:notice] = "Invalid Username/Password."
      redirect_to(:action => 'login')
    end
  end

  def show
    @user =User.find(params[:id])
    @tweet = Tweet.new
    @tweets = @user.tweets.order("created_at DESC")
    # @follow = @user.followers.order("created_at")
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
  	flash[:notice] = "Logged Out"
    redirect_to(:action => "login")
  end

  def search
    @search = User.search(params[:search])
    @user = current_user
  end

  private

  def user_params
    params.require(:users).permit(:name, :username, :email, :password)
  end
end

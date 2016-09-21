class UsersController < ApplicationController
	 before_action :user_signed_in?, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]

  def index
      @users = User.paginate(page: params[:page])
  end
  
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
	 def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

end

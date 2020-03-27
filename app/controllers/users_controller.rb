class UsersController < ApplicationController
  before_action :set_user

  def show
    @posts = @user.posts
  end

  def edit
    
  end

  def follow_list
    @followings = @user.followings
  end

  def set_user

    @user = User.find(params[:id])

    # if user_signed_in?
    #   @users = User.find(params[:id])
    # else
    #   redirect_to root_path
    # end
  end
end

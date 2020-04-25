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
  end
end

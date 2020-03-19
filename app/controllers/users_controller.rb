class UsersController < ApplicationController
  before_action :set_user

  def show
    @posts = @users.posts
  end

  def edit
    
  end

  def set_user

    @users = User.find(params[:id])

    # if user_signed_in?
    #   @users = User.find(params[:id])
    # else
    #   redirect_to root_path
    # end
  end
end

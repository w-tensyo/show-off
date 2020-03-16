class UsersController < ApplicationController
  before_action :set_user

  def show
  end

  def edit
    
  end

  def set_user
    if user_signed_in?
      @users = User.all
    else
      redirect_to root_path
    end
  end
end

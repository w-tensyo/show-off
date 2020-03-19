class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def show
  end

  def edit
  end

  def update
    binding.pry
    user = User.find(param[:id])
    user.update(configure_permitted_parameters)
    if user.save
      redirect_to user_path(current_user)
    else

    end
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :prof_image,:text])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :prof_image,:text])
  end
end





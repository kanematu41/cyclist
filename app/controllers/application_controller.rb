class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    # ログインの分岐
   if resource.is_a?(User)
    	posts_path
   elsif resource.is_a?(Admin)
    	admins_users_path
   end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

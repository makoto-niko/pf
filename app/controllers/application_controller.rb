class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

   #def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
     #devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
   #end
  
   #def authenticate_user!
    #unless user_signed_in?
      #redirect_to new_user_session_path, alert: 'ログインが必要です'
    #end
   #end
end
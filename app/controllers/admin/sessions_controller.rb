# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
 before_action :authenticate_admin!

  def after_sign_in_path_for(resource)
    root_path
  end
end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  #protected
  
  #def update_resource(resource, params)
    #if params[:password].blank? && params[:password_confirmation].blank?
      #resource.update_without_password(params.except(:current_password))
   # else
      #resource.update_with_password(params)
    #end
    
  #def configure_permitted_parameters
     #devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :is_active, :is_deleted])
  #end
  
  #end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

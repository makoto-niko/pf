# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

   def guest_sign_in
    user = User.guest
    pp "hoge", user
    sign_in user
    redirect_to root_path, notice: "guestuserでログインしました。"
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

 # protected
  
  #private
    
  # def prevent_logged_in_access
  #      redirect_to root_path if user_signed_in?
  # end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

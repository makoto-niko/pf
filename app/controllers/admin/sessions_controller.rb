class Admin::SessionsController < Devise::SessionsController
before_action :authenticate_admin!
# before_action :configure_sign_in_params, only: [:create]
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end

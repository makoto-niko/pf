class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user,only:[:show,:edit,:update]
  def index
    @users = User.page(params[:page]) 
  end

  def show
    if @user.nil?
     redirect_to root_path
    return
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
       redirect_to admin_users_path, notice: '会員情報が正常に更新されました'
    else
      render :edit
    end
  end

  private
  
  def set_user
    @user = User.find(params[:id])
    redirect_to admin_users_path, alert: '指定された会員が見つかりません。'
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :is_active,:is_admin)
  end
end
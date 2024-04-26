class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user,only[:show,:edit,:update]
  def index
    #@user = User.all
    @users = User.page(params[:page]) 
  end

  def show
    #@user = User.find_by(id: params[:id])
    if @user.nil?
     redirect_to root_path
    return
    end
  end

  def edit
    #@user = User.find(params[:id])
  end

  def update
    #@user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to admin_users_path, notice: "会員情報が正常に更新されました"
    else
      render :edit
    end
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to admin_users_path, alert: "指定された会員が見つかりません。"
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :is_active,:is_admin)
  end
end
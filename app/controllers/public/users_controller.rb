class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :ensure_guest_user, only: [:edit]
 def show
    @user = User.find(current_user.id)
  end
  
  def edit
     @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(current_user.id)
    #updated_params = user_params
    #updated_params.delete(:password) if updated_params[:password].blank?
    if @user.update(user_params)
      redirect_to edit_public_user_path(@user), notice: "会員情報を更新しました。"
    else
      flash.now[:alert] = "会員情報は更新できませんでした"
      redirect_to root_path
    end
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true, is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  def unsubscribe
    @user = User
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to root_path(user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
end

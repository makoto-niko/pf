class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :ensure_guest_user, only: [:edit]
 def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to my_page_path, notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理が完了しました。"
  end
  
  def unsubscribe
    @user = current_user
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to root_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
end

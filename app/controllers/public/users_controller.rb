class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :ensure_guest_user, only: [:edit]
  
  def index
    @users = User.active.page(params[:page])
  end
  
  def show
  end
  
  def edit
    redirect_to public_user_path(current_user) unless current_user.id == params[:id].to_i
  end

  
  def update
    if current_user.update(user_params)
      redirect_to edit_public_user_path(current_user) ,notice: "会員情報を更新しました。"
    else
      flash.now[:alert] = "会員情報は更新できませんでした"
      render 'edit'
    end
  end
 
  def withdraw
    if current_user.update(is_active: false)
      reset_session
      redirect_to root_path ,notice: "退会処理を実行し、ユーザーとその関連データを削除しました。"
    else
      flash[:alert] = "退会処理に失敗しました。"
      render 'edit' 
    end
  end
  
  def unsubscribe
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest?
      redirect_to root_path(@user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end 
  

end

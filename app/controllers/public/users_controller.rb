class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :ensure_guest_user, only: [:edit, :update]
  
  def index
    @users = User.active.page(params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "ユーザーが見つかりません。"
  end
  
  def edit
    redirect_to public_user_path(current_user) unless current_user.id == params[:id].to_i
  end

  
  def update
    if @user.update(user_params)
      redirect_to edit_public_user_path(current_user) ,notice: "会員情報を更新しました。"
    else
      flash.now[:alert] = "会員情報は更新できませんでした"
      render 'edit'
    end
  end
 
  def withdraw
    if current_user.update(is_active: false)
      reset_session
      redirect_to root_path, notice: "退会処理を実行し、ユーザーを削除しました。"
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
    redirect_to root_path(@user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。" if @user.guest?
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end 
  
end

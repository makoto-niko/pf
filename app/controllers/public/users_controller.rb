class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_current_user, only: [:show, :update, :withdraw]
  before_action :ensure_guest_user, only: [:edit]
  
  def index
    @users = User.active.page(params[:page])
    @records = []
  end
  
  def show
    #@user = User.find_by(id: current_user.id)
    if @user.nil?
    redirect_to root_path
    return
    end
  end
  
  def edit
    redirect_to public_user_path(current_user) unless current_user.id == params[:id].to_i
  end

  
  def update
    #@user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to edit_public_user_path(@user)
    else
      flash.now[:alert] = "会員情報は更新できませんでした"
      render 'edit'
    end
  end
 
  def withdraw
    #@user = User.find(current_user.id)
    @user.update(is_active: false)
    if @user.destroy
      reset_session
      flash[:notice] = "退会処理を実行し、ユーザーとその関連データを削除しました。"
      redirect_to root_path
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
    if @user.email == "guest@example.com"
      redirect_to root_path(@user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end 
  
  def set_current_user
    @user = current_user
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "ユーザーが見つかりません。"
  end

end

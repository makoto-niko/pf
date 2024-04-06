  class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @user = User.all
    @users = User.page(params[:page]) #ページネーション
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(customer_params)
      redirect_to admin_customer_path(@user), notice: "会員情報が正常に更新されました"
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:user).permit(:username, :email, :is_active)
  end

end
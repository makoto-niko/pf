class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:user_id])
    redirect_to request.referer && return if current_user == @user
    current_user.follow(@user)
    # redirect_to request.referer, notice: "フォローしました。"
  end
  
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    # redirect_to  request.referer, notice: "フォロー解除しました。"
  end
  
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end

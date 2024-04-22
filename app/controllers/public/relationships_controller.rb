class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:user_id])
    #安全策（自分自身のフォローはしないように。view側で制限はかけている
    redirect_to request.referer && return if current_user == @user
    current_user.follow(@user)
  end
  
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
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

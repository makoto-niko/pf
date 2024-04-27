class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:create, :destroy, :followings, :followers]

  def create
    # 安全策（自分自身のフォローはしないように。view側で制限はかけている）
    redirect_to request.referer && return if current_user == @user
    current_user.follow(@user)
  end
  
  def destroy
    current_user.unfollow(@user)
  end
  
  def followings
    @users = @user.followings
  end
  
  def followers
    @users = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end


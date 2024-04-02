class Admin::BoardPostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @group = Group.find(params[:group_id])
    @board_posts = @group.board_posts
    @users = User.all
  end
  
  def destroy
    @board_post = BoardPost.find(params[:id])
    @group = @board_post.group
    @board_post.destroy
    flash[:notice] = "削除に成功しました。"
    redirect_to admin_group_board_posts_path(group_id: @group.id)
  end
end


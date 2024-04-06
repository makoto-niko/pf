class Admin::BoardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @group = Group.find(params[:group_id])
    @board = @group.board_posts
    @users = User.all
  end
  
  def destroy
    @board = Board.find(params[:id])
    @group = @board.group
    @board.destroy
    flash[:notice] = "削除に成功しました。"
    redirect_to admin_group_board_posts_path(group_id: @group.id)
  end
end


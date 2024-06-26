class Admin::BoardsController < ApplicationController
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
    redirect_to admin_group_path(id: @group.id) ,notice: '削除に成功しました。'
  end
end


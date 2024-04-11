class Admin::CommentsController < ApplicationController
before_action :authenticate_admin!
before_action :set_group_and_board, only: [:index]
  def index
    @comments = Comment.all
    @users = User.all
  end
 
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path, notice: 'コメントが削除されました。'
  end

  private
  
  def set_group_and_board
    #@group = Group.find(params[:group_id])
    #@board = Board.find(params[:board_id])
  end
  def authenticate_admin!
    # 管理者かどうかを確認するロジック
  end
end
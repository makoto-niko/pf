class Admin::CommentsController < ApplicationController
before_action :authenticate_admin!
before_action :set_comment, only: [:confirm_destroy, :destroy]
  def index
    @comments = Comment.all
    @users = User.all
  end
 
  def confirm_destroy
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path, notice: 'コメントが削除されました。'
  end

  private
  
  def set_comment
    @comment = Comment.find(params[:id])
    #@group = Group.find(params[:group_id])
    #@board = Board.find(params[:board_id])
  end
  def authenticate_admin!
    # 管理者かどうかを確認するロジック
  end
end
class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_comment, only: [:confirm_destroy, :destroy]
  
  def index
    @comments = Comment.page(params[:page])
    @users = User.all
  end
 
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path, notice: 'コメントが削除されました。'
  end

  private
  
  def set_comment
    @comment = Comment.find(params[:id])
  end

end
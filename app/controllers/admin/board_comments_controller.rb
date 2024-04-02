class Admin::BoardCommentsController < ApplicationController
before_action :authenticate_admin!

  def index
  @board_post = BoardPost.find(params[:board_post_id])
  @board_comments = @board_post.board_comments
  end
  
  def create
  @board_post = BoardPost.find(params[:board_post_id])
  @board_comment = @board_post.board_comments.build(board_comment_params)
    if @board_comment.save
    flash[:notice] = "コメントを投稿しました。"
    redirect_to admin_board_post_board_comments_path(@board_post)
    else
    flash.now[:alert] = "コメントの投稿に失敗しました。"
    render 'index'
    end
  end
  
  def destroy
  @board_comment = BoardComment.find(params[:id])
  @board_comment.destroy
  redirect_to admin_board_post_board_comments_path(@board_comment.board_post), notice: "コメントを削除しました。"
  end
  
  private
  
  def board_comment_params
  params.require(:board_comment).permit(:comment)
  end
  
end

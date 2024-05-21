class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @board = Board.find(params[:board_id])
    @comment = @board.comments.build(comment_params)
    @comment.user = current_user
    @comment.created_at = Time.current
    if @comment.save
       redirect_to public_group_boards_path(@board.group), notice: 'コメントを投稿しました。'
    else
      @group = @board.group
      @boards = @group.boards
      render 'public/boards/index'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @board = @comment.board
    if @comment.written_by?(current_user)
      @comment.destroy
      redirect_to public_group_boards_path(@board.group),notice: 'コメントを削除しました。'
    else
      redirect_to public_group_board_path(@board.group, @board), alert: '権限がありません。'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end


class Public::BoardsController < ApplicationController
  before_action :authenticate_user!

 def index
  @group = Group.find(params[:group_id])
  @board = Board.new()
  @boards = @group.boards
  @comment = Comment.new
 end

  
  def new
  end

  def create
      @group = Group.find(params[:group_id])
      @board = Board.new(board_params)
      @board.user_id = current_user.id
      @board.group_id = @group.id
      if @board.save
        flash[:notice] = "登録に成功しました。"
        redirect_to public_group_boards_path(@group)
      else
        @boards = @group.boards
        render :index 
      end
  end
  
  def show
      @board = Board.find(params[:id])
      @Comment = Comment.new
  end



    def destroy
       @board = Board.find(params[:id])
      if  @board.user_id == current_user.id 
         @board.destroy 
      end
      flash[:notice] = "削除に成功しました。"
      redirect_to public_group_boards_path(params[:group_id]) # コミュニティの投稿一覧ページにリダイレクト
    end
    
  private

  def board_params
    params.require(:board).permit(:title, :description, :user_id, :group_id)
  end
end


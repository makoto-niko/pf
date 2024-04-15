class Public::BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tags = Tag.all
    @group = Group.all
    @group = Group.find(params[:group_id])
    @board = Board.new()
    @comment = Comment.new
    @boards = @group.boards
    if params[:keyword].present?
      @boards = @boards.where('title LIKE(?)', "%#{params[:keyword]}%")
             .or(@boards.where('description LIKE(?)', "%#{params[:keyword]}%"))
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @board = Board.find(params[:id])
    unless @board.user_id == current_user.id
      redirect_to public_group_boards_path(@group), alert: "編集権限がありません。"
    end
  end
  
  def show
      @board = Board.find_by(id: params[:id])
      @group = Group.find_by(id: params[:group_id])
      if @board.nil? || @group.nil?
       redirect_to root_path
       return
      end
  end
  
  def update
    @group = Group.find(params[:group_id])
    @board = Board.find(params[:id])
      if @board.user_id != current_user.id
        redirect_to public_group_boards_path(@group), alert: "更新権限がありません。"
      elsif @board.update(board_params)
        @board.save_tags_new(params[:board][:tag])
        flash[:notice] = "更新に成功しました。"
        redirect_to public_group_boards_path(@group) 
      else
        render :edit
      end
  end
  
  def create
      @group = Group.find(params[:group_id])
      @board = Board.new(board_params)
      @board.user_id = current_user.id
      @board.group_id = @group.id
      # unless params[:board][:tags].present?
      #   @board.errors.add(:base, 'タグが入力されていません。')
      # end
      if @board.save
        @board.save_tags(params[:board][:tags])
        flash[:notice] = "登録に成功しました。"
        redirect_to public_group_boards_path(@group)
      else
       @boards = @group.boards
       @tags = Tag.all
       @comment = Comment.new
        render :index 
      end
  end
  
  def destroy
    @board = Board.find(params[:id])
      if  @board.user_id == current_user.id 
         @board.destroy 
      end
    flash[:notice] = "削除に成功しました。"
    redirect_to public_group_boards_path(params[:group_id]) 
  end
    
  private

  def board_params
    params.require(:board).permit(:title, :description, :user_id, :group_id)
  end
end


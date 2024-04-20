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

      # タグのバリデーションのため、手動でバリデート
      @board.errors.add(:tags, 'が入力されていません。') unless params[:board][:tags].present?
      @board.errors.add(:title, 'が入力されていません。') unless board_params[:title].present?
      @board.errors.add(:description, 'が入力されていません。') unless board_params[:description].present?
      
      unless @board.errors.any? # 手動バリデートでエラーがあれば
        unless @board.valid? # 通常(モデル定義した)のバリデーションに引っかかっていれば
          @boards = @group.boards
          @tags = Tag.all
          @comment = Comment.new
          render :index
          return
        end
        @board.save
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
    tag_ids = @board.tags.ids
      if  @board.user_id == current_user.id 
         @board.destroy 
         Tag.where(id: tag_ids).destroy_all
      end
    flash[:notice] = "削除に成功しました。"
    redirect_to public_group_boards_path(params[:group_id]) 
  end
    
  private

  def board_params
    params.require(:board).permit(:title, :description, :user_id, :group_id)
  end
end


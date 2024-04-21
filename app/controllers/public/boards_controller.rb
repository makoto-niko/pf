class Public::BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @board = Board.new()
    @comment = Comment.new
    # 公開されている投稿だけを公開、モデルは公開は０
    boards = @group.boards.where(status: 0)
    #自分の投稿であれば、全て非公開投稿も公開
    if user_signed_in?
      @boards = boards.or(@group.boards.where(user_id: current_user.id))
    end

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
      
      # 非公開の投稿へのアクセス制御
      if @board.private_status? && @board.user_id != current_user.id && !current_user.is_admin?
        redirect_to public_group_boards_path(@group), alert: "この投稿は非公開です。"
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
      
    if @board.errors.any? || @board.invalid?# 手動バリデートでエラーがあれば または (モデル定義)のバリデーションに引っかかっていれば
      @boards = @group.boards
      @tags = Tag.all
      @comment = Comment.new
       render :index 
    else
      @board.save
      @board.save_tags(params[:board][:tags])
      flash[:notice] = "登録に成功しました。"
      redirect_to public_group_boards_path(@group)
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
    params.require(:board).permit(:title, :description, :user_id, :group_id, :status)
  end
end


class Public::BoardsController < ApplicationController
 before_action :authenticate_user!
 before_action :set_board, only:[:show,:destroy, :update, :edit]
 before_action :ensure_correct_board,only: [:edit, :update, :destroy]
 before_action :set_group,only:[:index,:show,:create,:edit,:update]


  def index
    @board = Board.new
    @boards = @group.boards.public_boards
    @boards = @boards.or(@group.boards.user_boards(current_user.id)) if user_signed_in?

     if params[:keyword].present?
      @boards = @boards.search(params[:keyword])
     end
  end

  def edit; end
  
  def show
    @board = Board.find(params[:id])
      # 非公開の投稿へのアクセス制御
      if @board.private_status? && !@board.written_by?(current_user)
        redirect_to public_group_boards_path(@group), alert: 'この投稿は非公開です。'
      end
  end
  
  def update
    if @board.update(board_params)
       @board.save_tags_new(params[:board][:tag])
       redirect_to public_group_boards_path(@group) ,notice: '更新に成功しました。'
    else
       render :edit
    end
  end
  
  def create
    @board = current_user.boards.new(board_params)
    @board.group_id = @group.id

    # タグのバリデーションのため、手動でバリデート。モデルで定義試みたができなかったため
    @board.errors.add(:tags, 'が入力されていません。') unless params[:board][:tags].present?
    @board.errors.add(:title, 'が入力されていません。') unless board_params[:title].present?
    @board.errors.add(:description, 'が入力されていません。') unless board_params[:description].present?
      
    if @board.errors.any? || @board.invalid?
      @boards = @group.boards.public_boards
      @boards = @boards.or(@group.boards.user_boards(current_user.id)) if user_signed_in?
      @tags = Tag.all
      @comment = Comment.new
      render :index
    else
      @board.save
      @board.save_tags(params[:board][:tags])
      redirect_to public_group_boards_path(@group) ,notice: '登録に成功しました。'
    end
  end
  
  def destroy
    @board.destroy
    redirect_to public_group_boards_path(params[:group_id]) ,notice: '削除に成功しました。'
  end
    
  private
  
  def set_board
    @board = Board.find(params[:id])
  end
  
  def ensure_correct_board
    board = Board.find(params[:id])
    unless board.written_by?(current_user)
      redirect_to root_path, alert: '権限がありません。'
    end
  end
  
  def set_group
    @group = Group.find(params[:group_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
  
  def board_params
    params.require(:board).permit(:title, :description, :user_id, :group_id, :status)
  end
end


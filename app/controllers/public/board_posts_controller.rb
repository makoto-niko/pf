class Public::BoardPostsController < ApplicationController
  before_action :authenticate_user!

 def index
  @group = Group.find(params[:group_id])
  @board_post = BoardPost.new
  @board_posts = @group.board_posts
  @users = User.all
 end

  
  def new
    #@board_post = BoardPost.new
  end

  def create
  @group = Group.find(params[:group_id])
  @board = Board.find_by(id: params[:board_id])  # find_byを使用し、nilを許容する
    
    if @board.present?
      @board_post = @group.board_posts.build(board_post_params)
      @board_post.user_id = current_user.id
      @board_post.board_id = @board.id
  
      if @board_post.save
        flash[:notice] = "登録に成功しました。"
        redirect_to public_group_board_posts_path(@group)
      else
        render :index
      end
    else
      flash[:alert] = "無効なボードIDです。"
      redirect_to public_group_board_posts_path(@group)
    end
  end



    def destroy
       @board_post =  Board_post.find(params[:id])
      if  @board_post.user_id == current_user.id 
         @board_post.destroy 
      end
      flash[:notice] = "削除に成功しました。"
      redirect_to public_board_posts_path(params[:group_id]) # コミュニティの投稿一覧ページにリダイレクト
    end
    
  private

  def board_post_params
    params.require(:board_post).permit(:description,:user_id, :board_id)
  end
end


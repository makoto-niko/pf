class Public::BoardPostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @group = Group.find(params[:group_id])
    @board_post = Board_post.new
    @board_posts = @group.post_boards
    @users = User.all
  end
  
  def new
    #@board_post = BoardPost.new
  end

  def create
    @group = Group.find(params[:group_id])
    @board_post = @group.board_posts
    @board_post = @group.board_posts.build(board_post_params)
    @board_post.user_id = current_user.id 
    if @board_post.save
      flash[:notice] = "登録に成功しました。"
      redirect_to public_board_posts_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render :index
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


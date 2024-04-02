class Public::BoardPostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
      if params[:group_id].present?
        @group = Group.find(params[:group_id])
        @board_posts = @group.board_posts
      else
        @board_posts = BoardPost.all
      end
      @board_post = BoardPost.new
      @users = User.all
  end
    
  def new
    @board_post = BoardPost.new
  end

  def create
    @board_post = BoardPost.new(board_post_params)
    @board_post.user_id = current_user.id

    if @board_post.save
      redirect_to public_board_posts_path, notice: "投稿が成功しました。"
    else
      render :new
    end
  end

  private

  def board_post_params
    params.require(:board_post).permit(:title, :content)
  end
end


class Public::BoardPostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
     @board_posts = BoardPost.all
     @board_post = BoardPost.new
  end
    
  def new
    @board_post = BoardPost.new
  end

  def create
    puts "Params: #{params.inspect}"
    @board_post = BoardPost.new(board_post_params)

    if @board_post.save
      redirect_to public_board_posts_path, notice: "投稿が成功しました。"
    else
      @board_posts = BoardPost.all
      render :index
    end
  end

  private

  def board_post_params
    params.require(:board_post).permit(:content)
  end
end


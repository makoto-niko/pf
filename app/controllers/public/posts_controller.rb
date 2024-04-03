class Public::PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.is_public = true
    if @post.save
      redirect_to public_post_path(@post), notice: "投稿が成功しました。"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end



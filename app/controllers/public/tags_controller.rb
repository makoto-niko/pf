class Public::TagsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    Tag.find(params[:id]).destroy()
    redirect_to public_boards_path
  end
end

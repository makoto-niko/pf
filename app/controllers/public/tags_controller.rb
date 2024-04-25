class Public::TagsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:keyword].present?
      @tags = Tag.where('name LIKE(?)', "%#{params[:keyword]}%")
    else
      @tags = Tag.all
    end
  end

  def show
    @tag = Tag.find_by(id: params[:id])
    if @tag.nil?
    redirect_to root_path
    return
    end 
  end

end

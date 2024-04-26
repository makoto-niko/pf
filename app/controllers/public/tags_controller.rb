class Public::TagsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tags = params[:keyword].present? ? Tag.search_by_name(params[:keyword]) : Tag.all
  end

  def show
    @tag = Tag.find_by(id: params[:id])
    if @tag.nil?
    redirect_to root_path
    return
    end 
  end

end

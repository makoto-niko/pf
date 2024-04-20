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

  #def destroy
    begin
      @tag = Tag.find(params[:id])
      @tag.destroy
      flash[:notice] = "タグを正常に削除しました。"
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "指定されたタグは見つかりませんでした。"
    ensure
        redirect_to params[:group_id].present? ? public_group_boards_path(group_id: params[:group_id]) : public_groups_path
    end
  #end
end

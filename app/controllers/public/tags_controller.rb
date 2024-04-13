class Public::TagsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tags = Tag.all 
    if params[:keyword].present?
    @tags = @tags.where('title LIKE(?)', "%#{params[:keyword]}%")
             .or(@tags.where('description LIKE(?)', "%#{params[:keyword]}%"))
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end

  #def destroy
    #Tag.find(params[:id]).destroy()
    #redirect_to public_group_boards_path
  #end
#end
  def destroy
    begin
      @tag = Tag.find(params[:id])
      @tag.destroy
      flash[:notice] = "タグを正常に削除しました。"
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "指定されたタグは見つかりませんでした。"
    ensure
        redirect_to params[:group_id].present? ? public_group_boards_path(group_id: params[:group_id]) : public_groups_path
    end
  end
end

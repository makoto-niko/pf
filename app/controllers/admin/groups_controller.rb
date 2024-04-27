class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group,only: [:show, :edit, :update,:destroy]
  def index
    @group = Group.new
    @groups = Group.all
  end
 
  def show
    if @group.nil?
      redirect_to root_path
    else
      @boards = @group.boards
    end
  end

  def edit
  end
  
  def update
    if @group.update(group_params)
      redirect_to admin_groups_path ,notice: "グループを更新しました。"
    else
      flash.now[:alert] = "グループの更新に失敗しました。"
      render 'edit'
    end
  end
  
  def create
    @group = Group.new(group_params)
    @group.admin_id = current_admin.id
    
    if @group.save
      redirect_to admin_groups_path ,notice: "グループを作成しました。"
    else
      @groups = Group.all
      flash.now[:alert] = "グループの作成に失敗しました。"
      render :index 
    end
  end
  
  def destroy
    @group.destroy
     redirect_to admin_groups_path ,notice: "削除に成功しました。"
  end
  
  private
  def set_group
    @group = Group.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to admin_groups_path, alert: "指定されたグループが見つかりません。"
  end
  
  def group_params
    params.require(:group).permit(:name, :description)
  end
end

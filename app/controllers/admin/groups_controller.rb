class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @group = Group.new
    @group = Group.all
  end
 
  def show
  @group = Group.find(params[:id])
  end

  def edit
   @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.all
    @Group = Group.new(group_params)
    @group.admin_id = current_admin.id
    if @group.save
      flash[:notice] = "グループを更新しました。"
      redirect_to admin_group_path(@group)
    else
      flash.now[:alert] = "グループの更新に失敗しました。"
      render 'edit'
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = "グループを削除しました。"
    redirect_to admin_groups_path
  end
  
   private
  
  def group_params
    params.require(:group).permit(:name, :description, :admin_id)
  end

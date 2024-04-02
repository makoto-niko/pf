class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
 def show
  @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
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
    params.require(:group).permit(:name, :explanation)
  end
  

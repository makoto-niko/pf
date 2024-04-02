class Public::GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "グループを作成しました。"
      redirect_to group_path(@group)
    else
      flash.now[:alert] = "グループの作成に失敗しました。"
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :explanation)
  end
end

 

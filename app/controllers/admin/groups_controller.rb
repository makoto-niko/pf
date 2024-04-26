class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group,only: [:show, :edit, :update,:destroy]
  def index
    @group = Group.new
    @groups = Group.all
  end
 
  def show
    #@group = Group.find_by(id: params[:id])
    if @group.nil?
      redirect_to root_path
    else
      @boards = @group.boards
    end
  end

  def edit
    #@group = Group.find(params[:id])
  end
  
  def update
    #@group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "グループを更新しました。"
      redirect_to admin_groups_path
    else
      flash.now[:alert] = "グループの更新に失敗しました。"
      render 'edit'
    end
  end
  
  def create
    @group = Group.new(group_params)
    @group.admin_id = current_admin.id
    
    if @group.save
      flash[:notice] = "グループを作成しました。"
      redirect_to admin_groups_path
    else
      @groups = Group.all
      flash.now[:alert] = "グループの作成に失敗しました。"
      render :index 
    end
  end
  
  def destroy
    #@group = Group.find_by(id: params[:id])
    #if @group
      @group.destroy
      flash[:notice] = "削除に成功しました。"
      redirect_to admin_groups_path
    #else
      #flash[:alert] = "指定されたボードは見つかりませんでした。"
      #@group = Group.new
      #@groups = Group.all
      #render :index
    #end
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

class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @group = Group.new
    @groups = Group.all
  end
 
  def show
    @group = Group.find_by(id: params[:id])
    if @group.nil?
      redirect_to root_path
    else
      @boards = @group.boards
    end
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
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
      @groups = Group.all
      flash[:notice] = "グループを作成しました。"
    else
      @groups = Group.all
      flash.now[:alert] = "グループの作成に失敗しました。"
    end

    render :index
  end
  
  def destroy
    @board = Board.find_by(id: params[:id])
    if @board
      @group = @board.group
      @board.destroy
      flash[:notice] = "削除に成功しました。"
      redirect_to admin_group_board_path(@group)
    else
      flash[:alert] = "指定されたボードは見つかりませんでした。"
      render :index
    end
  end

  
  private
  
  def group_params
    params.require(:group).permit(:name, :description, :admin_id)
  end
end

class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.all
  end
  
  def create
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
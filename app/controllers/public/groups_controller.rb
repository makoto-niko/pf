class Public::GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def delete
  end
end

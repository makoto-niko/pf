class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
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

class Public::CommentsController < ApplicationController
   before_action :authenticate_user!, only: [:create, :destroy]
  def index
  end

  def create
  end

  def delete
  end
end

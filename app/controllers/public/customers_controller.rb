class Public::CustomersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :unsubscribe, :withdraw]
  def show
  end

  def edit
  end

  def update
  end

  def my_page
  end

  def unsubscribe
  end

  def withdraw
  end
end

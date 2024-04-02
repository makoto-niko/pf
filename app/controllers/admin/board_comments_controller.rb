class Admin::BoardCommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
  end

  def delete
  end
end

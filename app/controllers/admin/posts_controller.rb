class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def delete
  end
end

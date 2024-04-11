class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    render 'admin/homes/top'
  end
end

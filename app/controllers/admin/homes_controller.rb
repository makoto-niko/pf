class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    render 'public/homes/top'
  end
end

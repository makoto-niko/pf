class Public::SearchsController < ApplicationController
 before_action :authenticate_user!
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @users = User.all
    @users = User.page(params[:page])
    @records = User.search_for(@content, @method).page(params[:search_page])
    #byebug
    render 'public/users/index'
  end
end

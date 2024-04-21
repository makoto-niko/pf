class Public::SearchsController < ApplicationController
 before_action :authenticate_user!
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @records = User.active.search_for(@content, @method).page(params[:search_page])
    render 'public/users/index'
  end
end




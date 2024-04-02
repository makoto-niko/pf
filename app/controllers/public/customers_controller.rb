class Public::CustomersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :unsubscribe, :withdraw]

  def show
    @customer = current_user
  end
  
  def edit
    @customer = current_user
  end
  
  def update
    @customer = current_user
    if @customer.update(customer_params)
      redirect_to my_page_path, notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end

  def withdraw
    @customer = current_user
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理が完了しました。"
  end
  
  def unsubscribe
    @customer = current_user
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:username, :email)
  end
end

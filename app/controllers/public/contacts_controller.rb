class Public::ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact,only:[:confirm, :back, :create]
  def new
    @contact = Contact.new
  end

  def confirm
    if @contact.invalid?
      render :new
    end
  end

  def back
    render :new
  end
  
  def reload 
    redirect_to new_public_contact_path
  end

  def create
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_public_contacts_path
    else
      flash[:alert] = @contact.errors.full_messages.join(", ")
      @contact = Contact.new
      render :new
    end
  end

  def done; end

  private
  
  def set_contact 
    @contact = Contact.new(contact_params)
  end
  
  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end

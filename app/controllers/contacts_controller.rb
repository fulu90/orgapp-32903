class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      redirect_to root_path
    else
      @contact = Contact.find(params[:id])
      render :edit
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:message)
  end
end

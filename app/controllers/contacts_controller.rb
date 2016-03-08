class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.new_contact(@contact).deliver_now
      redirect_to new_contact_url, notice: 'Thank you for contacting us'
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :message, :email, :phone_number)
  end
end

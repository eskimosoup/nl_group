class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    ContactMailer.new_contact(@contact).deliver_now if @contact.valid?
    create_contact_formats
  end

  def remote
    render layout: 'colorbox'
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :message, :email, :phone_number)
  end

  def create_contact_formats
    respond_to do |format|
      format.html do
        if @contact.valid?
          render :new
        else
          redirect_to root_url(anchor: 'new_contact'), notice: 'Thank you for contacting us'
        end
      end
      format.js { flash.notice = 'Thank you for contacting us ' if @contact.valid? }
    end
  end
end

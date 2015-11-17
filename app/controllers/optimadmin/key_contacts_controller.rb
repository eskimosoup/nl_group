module Optimadmin
  class KeyContactsController < Optimadmin::ApplicationController
    before_action :set_key_contact, only: [:show, :edit, :update, :destroy]

    def index
      @key_contacts = Optimadmin::BaseCollectionPresenter.new(collection: KeyContact.page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::KeyContactPresenter)
    end

    def show
    end

    def new
      @key_contact = KeyContact.new
    end

    def edit
    end

    def create
      @key_contact = KeyContact.new(key_contact_params)
      if @key_contact.save
        redirect_to key_contacts_url, notice: 'Key contact was successfully created.'
      else
        render :new
      end
    end

    def update
      if @key_contact.update(key_contact_params)
        redirect_to key_contacts_url, notice: 'Key contact was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @key_contact.destroy
      redirect_to key_contacts_url, notice: 'Key contact was successfully destroyed.'
    end

  private


    def set_key_contact
      @key_contact = KeyContact.find(params[:id])
    end

    def key_contact_params
      params.require(:key_contact).permit(:name, :email, :phone_number, :mobile_number)
    end
  end
end

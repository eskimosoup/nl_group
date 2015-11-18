module Optimadmin
  class AdminMessagesController < Optimadmin::ApplicationController
    before_action :set_admin_message, only: [:show, :edit, :update, :destroy]

    def index
      @admin_messages = Optimadmin::BaseCollectionPresenter.new(collection: AdminMessage.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::AdminMessagePresenter)
    end

    def show
    end

    def new
      @admin_message = AdminMessage.new
    end

    def edit
    end

    def create
      @admin_message = AdminMessage.new(admin_message_params)
      if @admin_message.save
        redirect_to admin_messages_url, notice: 'Admin message was successfully created.'
      else
        render :new
      end
    end

    def update
      if @admin_message.update(admin_message_params)
        redirect_to admin_messages_url, notice: 'Admin message was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @admin_message.destroy
      redirect_to admin_messages_url, notice: 'Admin message was successfully destroyed.'
    end

  private


    def set_admin_message
      @admin_message = AdminMessage.find(params[:id])
    end

    def admin_message_params
      params.require(:admin_message).permit(:title, :content, :display)
    end
  end
end

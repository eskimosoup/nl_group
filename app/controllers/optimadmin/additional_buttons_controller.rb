module Optimadmin
  class AdditionalButtonsController < Optimadmin::ApplicationController
    before_action :set_additional_button, only: [:show, :edit, :update, :destroy]

    def index
      @additional_block = AdditionalBlock.find(params[:additional_block_id])
      @additional_buttons = Optimadmin::BaseCollectionPresenter.new(collection: AdditionalButton.where('button_text ILIKE ? AND additional_block_id = ?', "%#{params[:search]}%", params[:additional_block_id]).positioned.page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::AdditionalButtonPresenter)
    end

    def show
    end

    def new
      @additional_button = AdditionalButton.new
      @additional_button.build_additional_animation
    end

    def edit
      @additional_button.build_additional_animation unless @additional_button.additional_animation.present?
    end

    def create
      @additional_button = AdditionalButton.new(additional_button_params)
      if @additional_button.save
        redirect_to additional_buttons_url(additional_block_id: @additional_button.additional_block.id), notice: 'Additional button was successfully created.'
      else
        render :new
      end
    end

    def update
      if @additional_button.update(additional_button_params)
        redirect_to additional_buttons_url(additional_block_id: @additional_button.additional_block.id), notice: 'Additional button was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @additional_block_id = @additional_button.additional_block.id
      @additional_button.destroy
      redirect_to additional_buttons_url(additional_block_id: @additional_block_id), notice: 'Additional button was successfully destroyed.'
    end

  private


    def set_additional_button
      @additional_button = AdditionalButton.find(params[:id])
    end

    def additional_button_params
      params.require(:additional_button).permit(:additional_block_id, :button_text, :button_link, :display, :position, :classes, additional_animation_attributes: [:animation_type, :animation_delay, :active])
    end
  end
end

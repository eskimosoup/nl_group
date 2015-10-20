module Optimadmin
  class AdditionalBlocksController < Optimadmin::ApplicationController
    before_action :set_additional_block, only: [:show, :edit, :update, :destroy]

    def index
      @additional_row = AdditionalRow.find(params[:additional_row_id])
      @additional_blocks = Optimadmin::BaseCollectionPresenter.new(collection: AdditionalBlock.where('name ILIKE ? AND additional_row_id = ?', "%#{params[:search]}%", params[:additional_row_id]).positioned.page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::AdditionalBlockPresenter)
    end

    def show
    end

    def new
      @additional_block = AdditionalBlock.new
      @additional_block.build_additional_animation
    end

    def edit
      @additional_block.build_additional_animation unless @additional_block.additional_animation.present?
    end

    def create
      @additional_block = AdditionalBlock.new(additional_block_params)
      if @additional_block.save
        redirect_to additional_blocks_url(additional_row_id: @additional_block.additional_row.id), notice: 'Additional block was successfully created.'
      else
        render :new
      end
    end

    def update
      if @additional_block.update(additional_block_params)
        redirect_to additional_blocks_url(additional_row_id: @additional_block.additional_row.id), notice: 'Additional block was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @row_id = @additional_block.additional_row.id
      @additional_block.destroy
      redirect_to additional_blocks_url(additional_row_id: @row_id), notice: 'Additional block was successfully destroyed.'
    end

  private


    def set_additional_block
      @additional_block = AdditionalBlock.find(params[:id])
    end

    def additional_block_params
      params.require(:additional_block).permit(:additional_row_id, :style, :name, :classes, :display, additional_animation_attributes: [:animation_type, :animation_delay, :active])
    end
  end
end

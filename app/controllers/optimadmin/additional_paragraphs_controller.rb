module Optimadmin
  class AdditionalParagraphsController < Optimadmin::ApplicationController
    before_action :set_additional_paragraph, only: [:show, :edit, :update, :destroy]

    def index
      @additional_paragraphs = Optimadmin::BaseCollectionPresenter.new(collection: AdditionalParagraph.where('name ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::AdditionalParagraphPresenter)
    end

    def show
    end

    def new
      @additional_paragraph = AdditionalParagraph.new
      @additional_paragraph.build_additional_animation
    end

    def edit
      @additional_paragraph.build_additional_animation unless @additional_button.additional_animation.present?
    end

    def create
      @additional_paragraph = AdditionalParagraph.new(additional_paragraph_params)
      if @additional_paragraph.save
        redirect_to additional_blocks_url(additional_row_id: @additional_paragraph.additional_block.additional_row.id), notice: 'Additional paragraph was successfully created.'
      else
        render :new
      end
    end

    def update
      if @additional_paragraph.update(additional_paragraph_params)
        redirect_to additional_blocks_url(additional_row_id: @additional_paragraph.additional_block.additional_row.id), notice: 'Additional paragraph was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @additional_row_id = @additional_paragraph.additional_block.additional_row.id
      @additional_paragraph.destroy
      redirect_to additional_blocks_url(additional_row_id: @additional_row_id), notice: 'Additional paragraph was successfully destroyed.'
    end

  private


    def set_additional_paragraph
      @additional_paragraph = AdditionalParagraph.find(params[:id])
    end

    def additional_paragraph_params
      params.require(:additional_paragraph).permit(:additional_block_id, :name, :content, :display, additional_animation_attributes: [:animation_type, :animation_delay, :active])
    end
  end
end

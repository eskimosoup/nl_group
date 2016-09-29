module Optimadmin
  class AdditionalTitlesController < Optimadmin::ApplicationController
    load_and_authorize_resource
    before_action :set_additional_title, only: [:show, :edit, :update, :destroy]

    def index
      @additional_titles = Optimadmin::BaseCollectionPresenter.new(collection: AdditionalTitle.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::AdditionalTitlePresenter)
    end

    def show
    end

    def new
      @additional_block = AdditionalBlock.find(params[:additional_block_id])
      @additional_title = AdditionalTitle.new
      @additional_title.build_additional_animation
    end

    def edit
      @additional_title.build_additional_animation unless @additional_title.additional_animation.present?
    end

    def create
      @additional_title = AdditionalTitle.new(additional_title_params)
      if @additional_title.save
        redirect_to additional_blocks_url(additional_row_id: @additional_title.additional_block.additional_row.id), notice: 'Additional title was successfully created.'
      else
        render :new
      end
    end

    def update
      if @additional_title.update(additional_title_params)
        redirect_to additional_blocks_url(additional_row_id: @additional_title.additional_block.additional_row.id), notice: 'Additional title was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @additional_row_id = @additional_title.additional_block.additional_row.id
      @additional_title.destroy
      redirect_to additional_blocks_url(additional_row_id: @additional_row_id), notice: 'Additional title was successfully destroyed.'
    end

    private

    def set_additional_title
      @additional_title = AdditionalTitle.find(params[:id])
    end

    def additional_title_params
      params.require(:additional_title).permit(:additional_block_id, :content, :display, :classes, additional_animation_attributes: [:animation_type, :animation_delay, :active])
    end
  end
end

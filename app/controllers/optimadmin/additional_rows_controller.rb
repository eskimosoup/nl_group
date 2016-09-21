module Optimadmin
  class AdditionalRowsController < Optimadmin::ApplicationController
    before_action :set_additional_row, only: [:show, :edit, :update, :destroy]

    def index
      @additional_rows = Optimadmin::BaseCollectionPresenter.new(collection: AdditionalRow.where('name ILIKE ?', "%#{params[:search]}%").positioned.page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::AdditionalRowPresenter)
    end

    def show
    end

    def new
      @additional_row = AdditionalRow.new
    end

    def edit
    end

    def create
      @additional_row = AdditionalRow.new(additional_row_params)
      if @additional_row.save
        redirect_to additional_rows_url, notice: 'Additional row was successfully created.'
      else
        render :new
      end
    end

    def update
      if @additional_row.update(additional_row_params)
        redirect_to additional_rows_url, notice: 'Additional row was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @additional_row.destroy
      redirect_to additional_rows_url, notice: 'Additional row was successfully destroyed.'
    end

    private

    def set_additional_row
      @additional_row = AdditionalRow.friendly.find(params[:id])
    end

    def additional_row_params
      params.require(:additional_row).permit(
        :name, :visible_title, :style, :display, :maximum_content_blocks,
        audience_ids: []
      )
    end
  end
end

module Optimadmin
  class WorkReasonsController < Optimadmin::ApplicationController
    before_action :set_work_reason, only: [:show, :edit, :update, :destroy]

    edit_images_for WorkReason, [[:image, { show: ['fit', 40, 40] }]]

    def index
      @work_reasons = Optimadmin::BaseCollectionPresenter.new(collection: WorkReason.positioned.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::WorkReasonPresenter)
    end

    def show
    end

    def new
      @work_reason = WorkReason.new
    end

    def edit
    end

    def create
      @work_reason = WorkReason.new(work_reason_params)
      if @work_reason.save
        redirect_to work_reasons_url, notice: 'Work reason was successfully created.'
      else
        render :new
      end
    end

    def update
      if @work_reason.update(work_reason_params)
        redirect_to work_reasons_url, notice: 'Work reason was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @work_reason.destroy
      redirect_to work_reasons_url, notice: 'Work reason was successfully destroyed.'
    end

  private


    def set_work_reason
      @work_reason = WorkReason.find(params[:id])
    end

    def work_reason_params
      params.require(:work_reason).permit(:position, :title, :image, :remote_image_url, :image_cache, :remove_image, :summary, :colour, :display)
    end
  end
end

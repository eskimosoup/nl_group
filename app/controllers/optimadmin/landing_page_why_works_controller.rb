module Optimadmin
  class LandingPageWhyWorksController < Optimadmin::ApplicationController
    load_and_authorize_resource

    before_action :set_landing_page_why_work, only: [:show, :edit, :update, :destroy]

    def index
      @landing_page_why_works = Optimadmin::BaseCollectionPresenter.new(collection: LandingPageWhyWork.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::LandingPageWhyWorkPresenter)
    end

    def show
    end

    def new
      @landing_page_why_work = LandingPageWhyWork.new
    end

    def edit
    end

    def create
      @landing_page_why_work = LandingPageWhyWork.new(landing_page_why_work_params)
      if @landing_page_why_work.save
        redirect_to landing_page_why_works_url, notice: 'Landing page why work was successfully created.'
      else
        render :new
      end
    end

    def update
      if @landing_page_why_work.update(landing_page_why_work_params)
        redirect_to landing_page_why_works_url, notice: 'Landing page why work was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @landing_page_why_work.destroy
      redirect_to landing_page_why_works_url, notice: 'Landing page why work was successfully destroyed.'
    end

    private

    def set_landing_page_why_work
      @landing_page_why_work = LandingPageWhyWork.find(params[:id])
    end

    def landing_page_why_work_params
      params.require(:landing_page_why_work).permit(:title, :reason_type, :content, :display, :position,
                                                    landing_page_ids: [])
    end
  end
end

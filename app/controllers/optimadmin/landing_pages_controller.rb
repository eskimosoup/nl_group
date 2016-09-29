module Optimadmin
  class LandingPagesController < Optimadmin::ApplicationController
    load_and_authorize_resource

    before_action :set_landing_page, only: [:show, :edit, :update, :destroy]

    def index
      @landing_pages = Optimadmin::BaseCollectionPresenter.new(collection: LandingPage.order(name: :asc),
                                                               view_template: view_context, presenter: Optimadmin::LandingPagePresenter)
    end

    def show
    end

    def new
      @landing_page = LandingPage.new
    end

    def edit
    end

    def create
      @landing_page = LandingPage.new(landing_page_params)
      if @landing_page.save
        redirect_to landing_pages_url, notice: 'Landing page was successfully created.'
      else
        render :new
      end
    end

    def update
      if @landing_page.update(landing_page_params)
        redirect_to landing_pages_url, notice: 'Landing page was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @landing_page.destroy
      redirect_to landing_pages_url, notice: 'Landing page was successfully destroyed.'
    end

    private

    def set_landing_page
      @landing_page = LandingPage.friendly.find(params[:id])
    end

    def landing_page_params
      params.require(:landing_page).permit(:name, :suggested_url, landing_page_why_work_ids: [], testimonial_ids: [],
                                                                  frequently_asked_question_ids: [])
    end
  end
end

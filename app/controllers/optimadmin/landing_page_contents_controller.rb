module Optimadmin
  class LandingPageContentsController < Optimadmin::ApplicationController
    load_and_authorize_resource

    before_action :set_landing_page_content, only: [:show, :edit, :update, :destroy]

    def index
      @landing_page_contents = Optimadmin::BaseCollectionPresenter.new(collection: LandingPageContent.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::LandingPageContentPresenter)
    end

    def show
    end

    def new
      @landing_page_content = LandingPageContent.new
    end

    def edit
    end

    def create
      @landing_page_content = LandingPageContent.new(landing_page_content_params)
      if @landing_page_content.save
        redirect_to landing_page_contents_url, notice: 'Landing page content was successfully created.'
      else
        render :new
      end
    end

    def update
      if @landing_page_content.update(landing_page_content_params)
        redirect_to landing_page_contents_url, notice: 'Landing page content was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @landing_page_content.destroy
      redirect_to landing_page_contents_url, notice: 'Landing page content was successfully destroyed.'
    end

    private

    def set_landing_page_content
      @landing_page_content = LandingPageContent.find(params[:id])
    end

    def landing_page_content_params
      params.require(:landing_page_content).permit(:landing_page_id, :title, :content, :area, :display)
    end
  end
end

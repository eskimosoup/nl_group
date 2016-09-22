class LandingPagesController < ApplicationController
  def show
    landing_page = LandingPage.friendly.find(params[:id])
    redirect_to landing_page_path(landing_page) if landing_page.slug != params[:id]
    @landing_page_facade = LandingPageFacade.new(landing_page)
  end
end

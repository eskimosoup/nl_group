class LandingPagesController < ApplicationController

  def show
    @landing_page = LandingPage.friendly.find(params[:id])
    if @landing_page.slug != params[:id]
      redirect_to landing_page_path(@landing_page)
    end
  end
end
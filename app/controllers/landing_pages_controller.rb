class LandingPagesController < ApplicationController

  def show
    @landing_page = LandingPage.friendly.find(params[:id])
    if @landing_page.slug != params[:id]
      redirect_to landing_page_path(@landing_page)
    end
    @landing_page_contents = @landing_page.landing_page_contents
    @landing_page_why_works = @landing_page.landing_page_why_works.displayed.order(position: :asc)
    @testimonials = @landing_page.testimonials
    @frequently_asked_questions = @landing_page.frequently_asked_questions
  end
end
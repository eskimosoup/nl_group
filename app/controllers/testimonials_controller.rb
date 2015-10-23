class TestimonialsController < ApplicationController
  def index
    @presented_testimonials = BaseCollectionPresenter.new(collection: Testimonial.displayed.positioned.page(params[:page]).per(params[:per_page] || 10), view_template: view_context, presenter: TestimonialPresenter)
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :global_site_settings, :load_objects

  def index
    @presented_testimonials = BaseCollectionPresenter.new(collection: Testimonial.displayed.positioned, view_template: view_context, presenter: TestimonialPresenter)
  end



  private

    def load_objects
      @header_menu = Optimadmin::Menu.new(name: "header")
      @contact = Contact.new
    end

    def global_site_settings
      @global_site_settings ||= Optimadmin::SiteSetting.current_environment
    end
    helper_method :global_site_settings

end

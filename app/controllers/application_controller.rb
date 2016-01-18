class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :global_site_settings, :load_objects
  #before_action { raise request.path.to_yaml }

  include AdditionalContentHelper

  def index
    @presented_additional_contents = collection_presenter(AdditionalRow.displayed.positioned)
    @presented_testimonials = collection_presenter(Testimonial.displayed.positioned)
    @presented_clients = collection_presenter(Client.displayed)
    @presented_team_members = collection_presenter(TeamMember.displayed.positioned)
    @presented_frequently_asked_questions = collection_presenter(FrequentlyAskedQuestion.ordered.displayed)
    @presented_work_reasons = collection_presenter(WorkReason.positioned.displayed)
    render layout: 'home'
  end


  private

    def presenter(object, klass = nil)
      klass ||= "#{object.class}Presenter".constantize if object.present?
      klass.new(object, view_context)
    end

    def collection_presenter(object, klass = nil)
      klass ||= "#{object.first.class}Presenter".constantize if object.present?
      BaseCollectionPresenter.new(collection: object, view_template: view_context, presenter: klass)
    end

    def load_objects
      @header_menu = Optimadmin::Menu.new(name: "header")
      @contact = Contact.new
    end

    def global_site_settings
      @global_site_settings ||= Optimadmin::SiteSetting.current_environment
    end
    helper_method :global_site_settings

end

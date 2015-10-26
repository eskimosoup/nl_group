class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :global_site_settings, :load_objects
  #before_action { raise request.path.to_yaml }

  def index
    @presented_additional_contents = BaseCollectionPresenter.new(collection: AdditionalRow.displayed.positioned, view_template: view_context, presenter: AdditionalRowPresenter)
    @presented_testimonials = BaseCollectionPresenter.new(collection: Testimonial.displayed.positioned, view_template: view_context, presenter: TestimonialPresenter)
    @presented_clients = BaseCollectionPresenter.new(collection: Client.displayed, view_template: view_context, presenter: ClientPresenter)
    @presented_team_members = BaseCollectionPresenter.new(collection: TeamMember.displayed.positioned, view_template: view_context, presenter: TeamMemberPresenter)
    @presented_frequently_asked_questions = BaseCollectionPresenter.new(collection: FrequentlyAskedQuestion.ordered.displayed, view_template: view_context, presenter: FrequentlyAskedQuestionPresenter)
    @presented_work_reasons = collection_presenter(WorkReason.positioned.displayed)
    render layout: 'home'
  end

  def blah
    raise request.parameters.to_yaml
    raise request.public_methods.to_yaml
  end



  private

    def presenter(object, klass = nil)
      klass ||= "#{object.class}Presenter".constantize
      klass.new(object, view_context)
    end

    def collection_presenter(object, klass = nil)
      klass ||= "#{object.first.class}Presenter".constantize
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

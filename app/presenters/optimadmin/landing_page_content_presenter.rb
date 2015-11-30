module Optimadmin
  class LandingPageContentPresenter < Optimadmin::BasePresenter
    presents :landing_page_content
    delegate :id, to: :landing_page_content

    def title
      landing_page_content.title
    end

    def landing_page_name
      landing_page_content.landing_page_name
    end
  end
end

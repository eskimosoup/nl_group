module Optimadmin
  class LandingPagePresenter < Optimadmin::BasePresenter
    presents :landing_page
    delegate :id, to: :landing_page

    def name
      landing_page.name
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.simple_format landing_page.summary
    end
  end
end

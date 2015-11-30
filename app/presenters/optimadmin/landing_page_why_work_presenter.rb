module Optimadmin
  class LandingPageWhyWorkPresenter < Optimadmin::BasePresenter
    presents :landing_page_why_work
    delegate :id, to: :landing_page_why_work

    def title
      landing_page_why_work.title
    end
  end
end

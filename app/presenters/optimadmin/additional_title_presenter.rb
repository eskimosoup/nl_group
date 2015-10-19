module Optimadmin
  class AdditionalTitlePresenter < Optimadmin::BasePresenter
    presents :additional_title
    delegate :id, to: :additional_title

    def title
      #additional_title.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.simple_format additional_title.summary
    end
  end
end

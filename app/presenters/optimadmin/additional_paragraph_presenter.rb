module Optimadmin
  class AdditionalParagraphPresenter < Optimadmin::BasePresenter
    presents :additional_paragraph
    delegate :id, to: :additional_paragraph

    def title
      #additional_paragraph.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.simple_format additional_paragraph.summary
    end
  end
end

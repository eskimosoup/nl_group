module Optimadmin
  class WorkReasonPresenter < Optimadmin::BasePresenter
    presents :work_reason
    delegate :id, to: :work_reason

    def title
      work_reason.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format work_reason.summary
    end
  end
end

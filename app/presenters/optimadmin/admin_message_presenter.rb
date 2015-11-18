module Optimadmin
  class AdminMessagePresenter < Optimadmin::BasePresenter
    presents :admin_message
    delegate :id, to: :admin_message

    def title
      admin_message.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.raw admin_message.content
    end
  end
end

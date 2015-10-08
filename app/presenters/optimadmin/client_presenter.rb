module Optimadmin
  class ClientPresenter < Optimadmin::BasePresenter
    presents :client
    delegate :id, to: :client

    def title
      #client.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.simple_format client.summary
    end
  end
end

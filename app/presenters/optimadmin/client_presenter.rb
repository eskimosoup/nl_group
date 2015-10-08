module Optimadmin
  class ClientPresenter < Optimadmin::BasePresenter
    presents :client
    delegate :id, to: :client

    def name
      client.name
    end

    def website_link
      h.link_to website, target: "_blank" if website?
    end

    private

    def website?
      website.present?
    end

    def website
      client.website
    end

  end
end

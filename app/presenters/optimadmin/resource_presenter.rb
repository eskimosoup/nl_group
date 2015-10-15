module Optimadmin
  class ResourcePresenter < Optimadmin::BasePresenter
    presents :resource
    delegate :id, to: :resource

    def name
      resource.name
    end

    def view_link
      h.link_to eye, resource.file.url, target: "_blank"
    end
  end
end

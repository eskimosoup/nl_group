class ResourcePresenter < BasePresenter
  presents :resource

  def name
    resource.name
  end

  def download_link
    h.link_to "Download", resource.file.url, target: "_blank", class: "button download"
  end
end
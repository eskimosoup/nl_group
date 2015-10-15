class ClientPresenter < BasePresenter
  presents :client

  def homepage
    if website?
      linked_logo
    else
      logo
    end
  end

  def name
    client.name
  end

  def linked_name
    h.link_to name, website, target: "_blank" if website?
  end

  def logo
    h.image_tag(client.logo.show, alt: name, title: name)
  end

  def linked_logo
    h.link_to logo, website, target: "_blank" if website?
  end

  private

  def website?
    website.present?
  end

  def website
    client.website
  end
end

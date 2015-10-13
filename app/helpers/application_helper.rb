module ApplicationHelper
  def social_media_link(network)
    return unless global_site_settings[network].present?
    link_to global_site_settings[network], title: network do
      image_tag "components/social/#{network.downcase.gsub(' ', '-')}.png", alt: network
    end
  end
end

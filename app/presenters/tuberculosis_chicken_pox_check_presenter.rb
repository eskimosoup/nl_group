class TuberculosisChickenPoxCheckPresenter < BasePresenter
  presents :tuberculosis_chicken_pox_check

  def edit_link
    h.link_to "Tuberculosis and Chicken Pox Information", h.edit_member_area_tuberculosis_chicken_pox_check_path
  end
end
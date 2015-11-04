class ImmunisationHistoryPresenter < BasePresenter
  presents :immunisation_history

  def edit_link
    h.link_to "Edit Immunisation History", h.edit_member_area_immunisation_history_path
  end
end
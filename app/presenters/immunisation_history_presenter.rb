class ImmunisationHistoryPresenter < BasePresenter
  presents :immunisation_history

  def edit_link
    h.link_to "Edit Immunisation History", h.edit_member_area_immunisation_history_path, class: 'user-action-button'
  end
end

class RefereePresenter < BasePresenter
  presents :referee

  def name
    referee.name
  end

  def position
    referee.position
  end

  def contact_number
    referee.contact_number
  end

  def fax_number
    referee.fax_number
  end

  def email_address
    referee.email_address
  end

  def postal_address
    referee.postal_address
  end

  def contact_referee_statement
    if contact_referee?
      "Allowed to contact prior to interview"
    else
      "Not allowed to contact prior to interview"
    end
  end

  def contact_referee?
    referee.contact_referee?
  end

  def edit_link
    h.link_to "Edit referee", h.edit_member_area_referee_path(referee), id: "edit-referee-#{ id }"
  end
end
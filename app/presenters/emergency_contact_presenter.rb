class EmergencyContactPresenter < BasePresenter
  presents :emergency_contact

  def full_name
    emergency_contact.full_name
  end

  def email_address
    emergency_contact.email_address
  end

  def mobile_number
    emergency_contact.mobile_number
  end

  def relationship
    emergency_contact.relationship
  end

  def edit_link
    h.link_to "Edit emergency contact", h.edit_member_area_emergency_contact_path
  end
end
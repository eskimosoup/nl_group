class KeyContactPresenter < BasePresenter
  presents :key_contact

  def name
    @name ||= key_contact.name
  end

  def phone_number
    @phone_number ||= key_contact.phone_number
  end

  def mobile_number
    @mobile_number ||= key_contact.mobile_number
  end

  def email
    h.mail_to key_contact.email if key_contact.email.present?
  end
end
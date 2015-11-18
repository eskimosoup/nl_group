class Dashboard
  attr_reader :member_profile

  def initialize(member_profile)
    @member_profile = member_profile
  end

  def key_contact
    return @key_contact if defined?(@key_contact)
    @key_contact = member_profile.key_contact
  end

  def key_contact?
    key_contact.present?
  end

  def admin_messages
    return @admin_messages if defined?(@admin_messages)
    @admin_messages = AdminMessage.all
  end

  def admin_messages?
    admin_messages.present?
  end

end
class Dashboard
  attr_reader :member_profile

  def initialize(member_profile)
    @member_profile = member_profile
  end

  def team_member
    return @team_member if defined?(@team_member)
    @team_member = member_profile.team_member
  end

  def team_member?
    team_member.present?
  end

  def unread_admin_messages
    @unread_messages ||= member_profile.unread_admin_messages.order(created_at: :desc)
  end

  def unread_admin_messages_count
    @unread_messages_count ||= unread_admin_messages.size
  end

  def unread_admin_messages?
    unread_admin_messages.present?
  end

  def dismissed_message_ids
    @dismissed_message_ids ||= member_profile.dismissed_message_ids
  end

end
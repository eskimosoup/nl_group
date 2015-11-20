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
    @unread_messages ||= member_profile.unread_admin_messages
  end

  def unread_admin_messages_count
    @unread_messages_count ||= unread_admin_messages.size
  end

  def unread_admin_messages?
    unread_admin_messages.present?
  end

end
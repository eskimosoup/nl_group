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

  def admin_messages
    return @admin_messages if defined?(@admin_messages)
    @admin_messages = AdminMessage.all
  end

  def admin_messages?
    admin_messages.present?
  end

end
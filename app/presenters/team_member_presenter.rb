class TeamMemberPresenter < BasePresenter
  presents :team_member

  def forename
    team_member.forename
  end

  def surname
    team_member.surname
  end

  def name
    [forename, surname].join(" ")
  end

  def role
    team_member.role
  end

  def profile
    h.raw team_member.profile
  end

  def phone
    team_member.phone
  end

  def email
    h.mail_to team_member.email if team_member.email
  end
end
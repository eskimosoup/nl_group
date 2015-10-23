class TeamMemberTeamPresenter < BasePresenter
  presents :team_member_team
  delegate :name, to: :team_member_team

  def team_members
    team_member_team.team_members
  end
end

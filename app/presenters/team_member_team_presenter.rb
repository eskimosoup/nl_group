class TeamMemberTeamPresenter < BasePresenter
  presents :team_member_team
  delegate :name, to: :team_member_team

  def team_members
    h.render partial: 'team_members/team_member', collection: team_member_team.team_members, as: :team_member_presenter 
  end
end

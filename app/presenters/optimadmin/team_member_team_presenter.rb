module Optimadmin
  class TeamMemberTeamPresenter < Optimadmin::BasePresenter
    presents :team_member_team
    delegate :id, :name, to: :team_member_team
  end
end

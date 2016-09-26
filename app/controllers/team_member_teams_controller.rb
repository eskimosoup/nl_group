class TeamMemberTeamsController < ApplicationController
  def show
    @team = find_team
    @presented_team_members = collection_presenter(@team.team_members.displayed.positioned)

    respond_to do |format|
      format.js
    end
  end

  private

  def find_team
    TeamMemberTeam.includes(:team_members).find(params[:id])
  end
end

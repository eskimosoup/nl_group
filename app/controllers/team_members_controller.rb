class TeamMembersController < ApplicationController
  before_action :team_member, only: :show

  def index
    @presented_team_member_teams = BaseCollectionPresenter.new(collection: TeamMemberTeam.displayed.positioned, view_template: view_context, presenter: TeamMemberTeamPresenter)
  end

  def show
    @presented_team_member = TeamMemberPresenter.new(object: @team_member, view_template: view_context)
    render layout: 'colorbox'
  end

  private

    def team_member
      @team_member = TeamMember.displayed.find(params[:id])
    end
end

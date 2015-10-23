module Optimadmin
  class TeamMemberTeamsController < Optimadmin::ApplicationController
    before_action :set_team_member_team, only: [:show, :edit, :update, :destroy]

    def index
      @team_member_teams = Optimadmin::BaseCollectionPresenter.new(collection: TeamMemberTeam.positioned.where('name ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::TeamMemberTeamPresenter)
    end

    def show
    end

    def new
      @team_member_team = TeamMemberTeam.new
    end

    def edit
    end

    def create
      @team_member_team = TeamMemberTeam.new(team_member_team_params)
      if @team_member_team.save
        redirect_to team_member_teams_url, notice: 'Team member team was successfully created.'
      else
        render :new
      end
    end

    def update
      if @team_member_team.update(team_member_team_params)
        redirect_to team_member_teams_url, notice: 'Team member team was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @team_member_team.destroy
      redirect_to team_member_teams_url, notice: 'Team member team was successfully destroyed.'
    end

  private


    def set_team_member_team
      @team_member_team = TeamMemberTeam.find(params[:id])
    end

    def team_member_team_params
      params.require(:team_member_team).permit(:position, :name, :display)
    end
  end
end

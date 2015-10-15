module Optimadmin
  class TeamMembersController < Optimadmin::ApplicationController
    before_action :set_team_member, only: [:show, :edit, :update, :destroy]

    def index
      @team_members = Optimadmin::BaseCollectionPresenter.new(collection: TeamMember.order(position: :asc),
                                                              view_template: view_context, presenter: Optimadmin::TeamMemberPresenter)
    end

    def show
    end

    def new
      @team_member = TeamMember.new
    end

    def edit
    end

    def create
      @team_member = TeamMember.new(team_member_params)
      if @team_member.save
        redirect_to team_members_url, notice: 'Team member was successfully created.'
      else
        render :new
      end
    end

    def update
      if @team_member.update(team_member_params)
        redirect_to team_members_url, notice: 'Team member was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @team_member.destroy
      redirect_to team_members_url, notice: 'Team member was successfully destroyed.'
    end

  private


    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end

    def team_member_params
      params.require(:team_member).permit(:forename, :surname, :image, :profile, :email, :phone, :role, :display, :position)
    end
  end
end

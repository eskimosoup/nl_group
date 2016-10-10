class AudiencesController < ApplicationController
  def show
    @audience = Audience.friendly.find(params[:id])
    @header_menu = find_navigation
    @presented_additional_contents = collection_presenter(@audience.additional_rows.displayed.positioned)
    @presented_testimonials = collection_presenter(@audience.testimonials.displayed.positioned)
    @presented_clients = collection_presenter(Client.displayed)
    @presented_available_roles = collection_presenter(AvailableRole.displayed)
    @presented_job_roles = JobRole.displayed
    @presented_team_members = collection_presenter(TeamMember.displayed.positioned)
    @presented_frequently_asked_questions = collection_presenter(@audience.frequently_asked_questions.ordered.displayed)
    @presented_work_reasons = collection_presenter(@audience.work_reasons.positioned.displayed)
    @team_member_teams = TeamMemberTeam.includes(:team_members).displayed
  end

  private

  def find_navigation
    Optimadmin::Menu.new(name: @audience.navigation_menu_name)
  rescue
    nil
  end
end

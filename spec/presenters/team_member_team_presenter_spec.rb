require "rails_helper"

RSpec.describe TeamMemberPresenter, type: :presenter, team_member_team: true do
  let(:team_member) { build(:team_member_team) }
  subject(:team_member_team_presenter) { TeamMemberTeamPresenter.new(object: team_member, view_template: view) }

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:team_member) }
  end

  describe "standard team_member_team" do
    it "returns the team members" do
      expect(team_member_team_presenter.team_members).to eq(render partial: 'team_members/team_member', collection: team_member_team.team_members, as: :team_member_presenter)
    end
  end
end

require 'rails_helper'
#  rspec --tag "team_member_team"
RSpec.describe TeamMemberTeam, type: :model, team_member_team: true do
  describe "validations", :validation do
    subject(:team_member_team) { build(:team_member_team) }
    it { should validate_presence_of(:name) }
  end

  describe "associations", :association do
    it { should have_many(:team_members) }
  end

  describe "scopes", :scope do
    let(:team_member_team) { create(:team_member_team) }
    let(:hidden_team_member_team) { create(:team_member_team, display: false) }

    it 'only returns displayed' do
      expect(TeamMemberTeam.displayed).not_to include hidden_team_member_team
    end
  end
end

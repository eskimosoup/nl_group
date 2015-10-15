require "rails_helper"

RSpec.describe Optimadmin::TeamMemberPresenter, type: :presenter do
  let(:team_member) { build(:team_member) }
  subject(:team_member_presenter) { Optimadmin::TeamMemberPresenter.new(object: team_member, view_template: view) }

  it "should return the forename" do
    expect(team_member_presenter.forename).to eq(team_member.forename)
  end

  it "should return the surname" do
    expect(team_member_presenter.surname).to eq(team_member.surname)
  end

  it "should return the name" do
    expect(team_member_presenter.name).to eq("#{ team_member.forename } #{ team_member.surname }")
  end
end

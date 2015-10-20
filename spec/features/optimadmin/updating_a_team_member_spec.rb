require "rails_helper"

RSpec.describe "Updating a team member", type: :feature, js: true do
  subject!(:team_member) { create(:team_member) }
  it "should allow a team member to be updated" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Team Members"

    expect(current_path).to eq(optimadmin.team_members_path)
    expect(page).to have_content(team_member.forename)

    within("#item_#{ team_member.id }") do
      find(:xpath, "//a[@href='#{ current_host_and_port }#{ optimadmin.edit_team_member_path(team_member) }']").click
    end
    expect(page).to have_content("Edit Team Member")
    fill_in "Forename", with: "Johnny"
    click_button "Update Team member"

    expect(page).to have_content('Team member was successfully updated.')
  end
end
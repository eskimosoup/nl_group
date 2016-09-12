require 'rails_helper'

RSpec.feature "Creating A Team Member", type: :feature do
  it "should allow a client to be created" do
    team = create(:team_member_team, name: 'Blah')

    login_to_admin_with("optimised", "optipoipoip")
    click_link "Team Members"
    expect(current_path).to eq(optimadmin.team_members_path)
    click_link "New Team Member"
    expect(current_path).to eq(optimadmin.new_team_member_path)

    fill_in "Forename", with: "Joe"
    fill_in "Surname", with: "Bloggs"
    fill_in "Role", with: "Supreme Ruler"
    fill_in "Email", with: "joe.bloggs@example.com"
    fill_in "Phone", with: "01234 567890"
    select team.name, from: "Team member team"
    click_button "Create Team member"

    expect(current_path).to eq(optimadmin.team_members_path)
    expect(page).to have_content("Team member was successfully created.")
  end
end

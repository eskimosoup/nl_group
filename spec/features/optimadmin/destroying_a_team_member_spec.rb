require 'rails_helper'

RSpec.feature "Destroying A Team Member", type: :feature, js: true do
  subject!(:team_member) { create(:team_member) }
  it "should allow a team_member to be destroyed" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Team Members"

    expect(current_path).to eq(optimadmin.team_members_path)
    expect(page).to have_content(team_member.forename)

    within("#item_#{ team_member.id }") do
      find("a[data-method='delete']").click
    end
    # Click ok on confirm
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('Team member was successfully destroyed.')
  end
end
require "rails_helper"

RSpec.feature "Logging into and out of the member area", type: :feature do

  subject!(:member_profile){ create(:member_profile) }

  it "should allow users to login" do
    login_to_member_area_with(member_profile.email, "password")
  end

  it "should have a failed login" do
    visit member_area_login_path
    # use lower case so it looks for the for as contact us form in footer has email field
    fill_in "email", with: "blah@example.com"
    fill_in "password", with: "blah"
    click_button "Login"

    expect(page).to have_content "Email or password is invalid"
  end

  it "should allow users to logout" do
    login_to_member_area_with(member_profile.email, "password")
    click_link "Logout"
    expect(current_path).to eq(member_area_login_path)
  end
end

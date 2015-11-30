require "rails_helper"

RSpec.feature "Changing password", type: :feature do
  subject!(:member_profile){ create(:member_profile) }

  it "allows user to change password" do
    login_to_member_area_with(member_profile.email, "password")

    click_link "Edit Profile"

    expect(current_path).to eq(edit_member_area_member_profile_path)
    expect(page).to have_content "Edit Member Profile"

    fill_in "Password", with: "blah"
    fill_in "Password confirmation", with: "blah"
    click_button "Update Member profile"

    expect(current_path).to eq(member_area_member_profile_path)
    expect(page).to have_content "Successfully updated member profile"
  end

  it "causes errors if password doesn't match confirmation" do
    login_to_member_area_with(member_profile.email, "password")

    click_link "Edit Profile"

    expect(current_path).to eq(edit_member_area_member_profile_path)
    expect(page).to have_content "Edit Member Profile"

    fill_in "Password", with: "blah"
    fill_in "Password confirmation", with: "blah2"
    click_button "Update Member profile"

    expect(page).to have_content "prevented your member profile from being saved"
  end
end
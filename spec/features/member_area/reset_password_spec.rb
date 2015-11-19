require "rails_helper"

RSpec.feature "Resetting password", type: :feature do
  it "emails user when requesting password reset" do
    member_profile = create(:member_profile)
    visit member_area_login_path
    click_link "Forgotten password?"
    fill_in "Email", with: member_profile.email
    click_button "Reset Password"
    expect(page).to have_content "Email sent"
    expect(last_email.to).to include(member_profile.email)
  end

  it "does not email invalid member profile when requesting password reset" do
    visit member_area_login_path
    click_link "Forgotten password?"
    fill_in "Email", with: "madeupuser@example.com"
    click_button "Reset Password"
    expect(page).to have_content "Email sent"
    expect(last_email).to be_nil
  end

  it "allows password to be reset" do
    member_profile = create(:member_profile)
    member_profile.request_password_reset

    visit edit_member_area_password_reset_url(member_profile.password_reset_token)
    fill_in "member_profile_password", with: "password"
    fill_in "member_profile_password_confirmation", with: "password"
    click_button "Update Password"

    expect(page).to have_content("Password has been reset.")
    expect(current_path).to eq(member_area_member_profile_path)
  end

  it "fails if password reset was over 2 hours ago" do
    member_profile = create(:expired_password_reset_member_profile)
    visit edit_member_area_password_reset_url(member_profile.password_reset_token)
    fill_in "member_profile_password", with: "password"
    fill_in "member_profile_password_confirmation", with: "password"
    click_button "Update Password"

    expect(page).to have_content("Password reset has expired.")
    expect(current_path).to eq(new_member_area_password_reset_path)
  end
end
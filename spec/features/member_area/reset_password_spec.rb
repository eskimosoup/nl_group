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
end
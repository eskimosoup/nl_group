require "rails_helper"

RSpec.feature "Setting initial password" do
  describe "member has already set password" do
    subject { create(:member_profile) }

    it "should not allow setting password" do
      visit edit_member_area_set_password_url(subject.password_set_token)
      expect(current_path).to eq(member_area_login_path)
      expect(page).to have_content("Password already set, please login or request a reset")
    end
  end

  describe "new member" do
    subject { create(:member_profile_no_password) }

    it "should allow setting of password" do
      visit edit_member_area_set_password_url(subject.password_set_token)
      fill_in "member_profile_password", with: "password"
      fill_in "member_profile_password_confirmation", with: "password"
      click_button "Set Password"

      expect(page).to have_content("Password has been set.")
      expect(current_path).to eq(member_area_member_profile_path)
    end
  end
end

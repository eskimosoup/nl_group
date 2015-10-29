require "rails_helper"

RSpec.feature "Creating and editing member qualifications", type: :feature, js: true do
  let!(:member_profile){ create(:member_profile) }
  it "should allow creation of member qualifications" do
    login_to_member_area_with(member_profile.email, "password")
    click_link "Qualifications"

    fill_in "member_qualification_register", with: "Some register"
    fill_in "member_qualification_registration_number", with: "12345"
    select_date(3.years.from_now, from: "member_qualification_expiry_date")
    choose "member_qualification_afc_band_3"

    click_link "Add Qualification"

    expect(page).to have_selector("#qualifications .nested-fields", count: 1)
    within(all("#qualifications .nested-fields").last) do
      fill_in "Name", with: "Some Qualification"
      fill_in "Grade obtained", with: "A"
    end
    click_button "Save"

    expect(page).to have_content "Qualifications were successfully saved"
    expect(current_path).to eq(member_area_member_profile_path)
  end

  it "should allow updating of member qualifications" do
    member_qualification = create(:member_qualification, member_profile: member_profile)
    login_to_member_area_with(member_profile.email, "password")
    click_link "Qualifications"

    fill_in "member_qualification_register", with: "Some register"
    fill_in "member_qualification_registration_number", with: "12345"
    select_date(3.years.from_now, from: "member_qualification_expiry_date")
    choose "member_qualification_afc_band_3"

    click_link "Add Qualification"

    expect(page).to have_selector("#qualifications .nested-fields", count: 1)
    within(all("#qualifications .nested-fields").last) do
      fill_in "Name", with: "Some Qualification"
      fill_in "Grade obtained", with: "A"
    end

    click_button "Save"

    expect(page).to have_content "Qualifications were successfully updated"
    expect(current_path).to eq(member_area_member_profile_path)
  end

end
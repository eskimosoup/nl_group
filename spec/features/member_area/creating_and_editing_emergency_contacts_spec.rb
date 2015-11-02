require "rails_helper"

RSpec.feature "Creating and editing emergency contacts", type: :feature do
  let!(:member_profile){ create(:member_profile) }

  it "should allow creation and editing of referees" do
    login_to_member_area_with(member_profile.email, "password")
    click_link "Referees and Emergency Contacts"

    click_link "New emergency contact"

    expect(page).to have_content("Emergency Contact")

    fill_in "emergency_contact_full_name", with: "John Doe"
    fill_in "emergency_contact_email_address", with: "john@example.com"
    fill_in "emergency_contact_mobile_number", with: "01234 567890"
    fill_in "emergency_contact_relationship", with: "Parent"

    click_button "Save"

    expect(current_path).to eq(member_area_referees_and_emergency_contact_path)
    expect(page).to have_content("Emergency contact was successfully saved")

    click_link "Edit emergency contact"

    expect(page).to have_content("Emergency Contact")
    fill_in "emergency_contact_mobile_number", with: "01482 457690"
    click_button "Save"

    expect(current_path).to eq(member_area_referees_and_emergency_contact_path)
    expect(page).to have_content("Emergency contact was successfully updated")
  end
end

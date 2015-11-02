require "rails_helper"

RSpec.feature "Creating and updating referees", type: :feature do

  let!(:member_profile){ create(:member_profile) }

  it "should allow creation and editing of referees" do
    login_to_member_area_with(member_profile.email, "password")
    click_link "Referees and Emergency Contacts"

    click_link "New Referee"

    fill_in "referee_name", with: "Jane Doe"
    fill_in "referee_position", with: "A position"
    fill_in "referee_contact_number", with: "01234 567890"
    fill_in "referee_fax_number", with: "01234 567890"
    fill_in "referee_email_address", with: "jane.doe@example.com"
    fill_in "referee_postal_address", with: "Some address"
    choose "referee_contact_referee_true"

    click_button "Save"

    expect(page).to have_content "Referee successfully saved"
    expect(current_path).to eq(member_area_referees_and_emergency_contact_path)

    click_link "Edit referee"

    fill_in "referee_name", with: "John Doe"
    fill_in "referee_email_address", with: "john.doe@example.com"

    click_button "Save"

    expect(page).to have_content "Referee successfully updated"
    expect(current_path).to eq(member_area_referees_and_emergency_contact_path)
  end
end
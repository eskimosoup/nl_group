require "rails_helper"

RSpec.feature "Creating and editing a basic medical history", type: :feature do
  let!(:member_profile){ create(:member_profile) }

  it "should allow creation and updating" do
    login_to_member_area_with(member_profile.email, "password")

    click_link "Application form"

    click_link "Occupational Health Screening"

    click_link "New Basic Medical History"

    expect(current_path).to eq(new_member_area_basic_medical_history_path)
    fill_in "basic_medical_history_gp_address", with: "Some address"
    choose("basic_medical_history_illness_affecting_work_false")
    choose("basic_medical_history_illness_caused_by_work_false")
    choose("basic_medical_history_require_assistance_false")
    choose("basic_medical_history_having_treatment_false")
    click_button "Save"

    expect(current_path).to eq(member_area_occupational_health_screening_path)
    expect(page).to have_content("Basic medical history successfully saved")

    click_link "Edit Basic Medical History"
    expect(current_path).to eq(edit_member_area_basic_medical_history_path)

    fill_in "basic_medical_history_gp_address", with: "Another address"
    click_button "Save"

    expect(current_path).to eq(member_area_occupational_health_screening_path)
    expect(page).to have_content("Basic medical history successfully updated")

  end
end
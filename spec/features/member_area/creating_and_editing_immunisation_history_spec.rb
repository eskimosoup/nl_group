require "rails_helper"

RSpec.feature "Creating and editing immunisation history", type: :feature do
  let!(:member_profile){ create(:member_profile) }

  it "should allow creation and editing of immunisation history" do
    login_to_member_area_with(member_profile.email, "password")
    click_link "Occupational Health Screening"
    click_link "New Immunisation History"

    expect(current_path).to eq(new_member_area_immunisation_history_path)
    expect(page).to have_content("New Immunisation History")

    choose("immunisation_history_had_triple_vaccination_true")
    select_date(Date.today, from: "immunisation_history_triple_vaccination_date")

    choose("immunisation_history_had_polio_vaccination_true")
    select_date(Date.today, from: "immunisation_history_polio_vaccination_date")

    choose("immunisation_history_had_hepatitis_b_vaccination_true")
    select_date(Date.today, from: "immunisation_history_hepatitis_b_vaccination_date")

    choose("immunisation_history_role_involves_epps_true")

    click_button "Save"

    expect(current_path).to eq(member_area_occupational_health_screening_path)
    expect(page).to have_content "Immunisation history was successfully saved"

    click_link "Edit Immunisation History"
    expect(current_path).to eq(edit_member_area_immunisation_history_path)
    expect(page).to have_content("Edit Immunisation History")

    select_date(Date.yesterday, from: "immunisation_history_triple_vaccination_date")
    click_button "Save"

    expect(current_path).to eq(member_area_occupational_health_screening_path)
    expect(page).to have_content "Immunisation history was successfully updated"
  end
end

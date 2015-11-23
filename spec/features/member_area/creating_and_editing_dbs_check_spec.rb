require "rails_helper"

RSpec.feature "Creating and editing dbs check" do
  let(:member_profile) { create(:member_profile) }

  it "should allow creation and editing" do
    login_to_member_area_with(member_profile.email, member_profile.password)

    click_link "Application form"
    click_link "DBS Check"
    expect(current_path).to eq(new_member_area_dbs_check_path)
    expect(page).to have_content("New DBS Check")
    choose("dbs_check_enhanced_dbs_completed_before_false")

    choose("dbs_check_unprotected_convictions_false")
    choose("dbs_check_unfiltered_convictions_false")
    choose("dbs_check_another_country_police_check_false")
    choose("dbs_check_suspended_or_under_investigation_false")

    click_button "Save"

    expect(page).to have_content "DBS Check successfully saved"
    expect(current_path).to eq(member_area_application_form_overview_path)

    click_link "DBS Check"
    expect(current_path).to eq(edit_member_area_dbs_check_path)
    expect(page).to have_content("Edit DBS Check")

    choose("dbs_check_suspended_or_under_investigation_true")
    fill_in "dbs_check_additional_information", with: "Some content"

    click_button "Save"

    expect(page).to have_content "DBS Check successfully updated"
    expect(current_path).to eq(member_area_application_form_overview_path)
  end
end

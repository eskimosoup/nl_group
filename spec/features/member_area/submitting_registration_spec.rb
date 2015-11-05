require "rails_helper"

RSpec.feature "Submitting registration", type: :feature do
  let!(:member_profile){ create(:member_profile) }

  it "should successfully create the submission" do
    login_to_member_area_with(member_profile.email, member_profile.password)
    visit new_member_area_member_submission_path
    expect(current_path).to eq(new_member_area_member_submission_path)

    expect(page).to have_content("Submit Application To NL Group")

    check("member_submission_downloaded_handbook")
    check("member_submission_health_information_accurate")
    check("member_submission_full_acknowledgement")

    click_button "Save"

    expect(page).to have_content("Submission completed")
  end
end

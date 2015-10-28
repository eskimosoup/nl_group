require "rails_helper"

RSpec.feature "setting work eligibility", type: :feature do
  let!(:member_profile){ create(:member_profile) }

  it "should allow creation of work eligibility" do
    login_to_member_area_with("joe.bloggs@example.com", "password")
    click_link "Eligibility To Work"

    expect(current_path).to eq(new_member_area_work_eligibility_path)
    expect(page).to have_content("Eligibility To Work")

    fill_in "Passport number", with: "1234567890"
    select_date (Date.today + 2.years), from: "work_eligibility_expiry_date"
    fill_in "Nationality", with: "British"
    choose("work_eligibility_hold_eu_passport_true")

    click_button "Save"
    expect(page).to have_content("Eligibility to work successfully saved")
  end

  it "should allow editing of work eligibility" do
    work_eligibility = create(:work_eligibility, member_profile: member_profile)
    login_to_member_area_with("joe.bloggs@example.com", "password")
    click_link "Eligibility To Work"

    expect(current_path).to eq(edit_member_area_work_eligibility_path)
    expect(page).to have_content("Eligibility To Work")

    fill_in "Passport number", with: "1234567890"
    select_date (Date.today + 2.years), from: "work_eligibility_expiry_date"
    fill_in "Nationality", with: "British"
    choose("work_eligibility_hold_eu_passport_true")

    click_button "Save"
    expect(page).to have_content("Eligibility to work successfully updated")
  end

end
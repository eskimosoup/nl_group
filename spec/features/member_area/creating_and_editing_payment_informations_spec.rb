require "rails_helper"

RSpec.feature "Creating and updating payment informations", type: :feature do
  let!(:member_profile){ create(:member_profile) }

  it "should allow creation and editing" do
    login_to_member_area_with(member_profile.email, member_profile.password)

    click_link "Payment Information"
    expect(current_path).to eq(new_member_area_payment_information_path)
    expect(page).to have_content("New Payment Information")

    choose("payment_information_payment_methodology_paye_payroll")
    choose("payment_information_limit_working_week_true")

    click_button "Save"

    expect(current_path).to eq(member_area_member_profile_path)
    expect(page).to have_content("Payment information successfully saved")

    click_link "Payment Information"
    expect(current_path).to eq(edit_member_area_payment_information_path)
    expect(page).to have_content("Edit Payment Information")
    choose("payment_information_limit_working_week_false")

    click_button "Save"

    expect(current_path).to eq(member_area_member_profile_path)
    expect(page).to have_content("Payment information successfully updated")
  end
end

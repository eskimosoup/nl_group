require "rails_helper"

RSpec.feature "Creating and updating payment declarations", type: :feature do
  let!(:member_profile){ create(:member_profile) }

  it "should allow creation and editing" do
    login_to_member_area_with(member_profile.email, member_profile.password)

    click_link "Payment Declaration"
    expect(current_path).to eq(new_member_area_payment_declaration_path)
    expect(page).to have_content("New Payment Declaration")

    choose("payment_declaration_payment_methodology_paye_payroll")
    choose("payment_declaration_limit_working_week_true")
    check("payment_declaration_downloaded_handbook")

    click_button "Save"

    expect(current_path).to eq(member_area_member_profile_path)
    expect(page).to have_content("Payment declaration successfully saved")

    click_link "Payment Declaration"
    expect(current_path).to eq(edit_member_area_payment_declaration_path)
    expect(page).to have_content("Edit Payment Declaration")
    choose("payment_declaration_limit_working_week_false")
    check("payment_declaration_downloaded_handbook")

    click_button "Save"

    expect(current_path).to eq(member_area_member_profile_path)
    expect(page).to have_content("Payment declaration successfully updated")
  end
end

require "rails_helper"

RSpec.feature "Creating and editing tuberculosis chicken pox checks", type: :feature, js: true do
  let!(:member_profile){ create(:member_profile) }
  it "should allow creation and editing" do
    login_to_member_area_with(member_profile.email, "password")
    click_link "Tuberculosis and Chicken Pox Information"

    expect(current_path).to eq(new_member_area_tuberculosis_chicken_pox_check_path)

    choose("tuberculosis_chicken_pox_check_lived_continuously_true")
    choose("tuberculosis_chicken_pox_check_bcg_vaccination_true")
    select_date(3.years.ago, from: "tuberculosis_chicken_pox_check_vaccination_date")

    choose("tuberculosis_chicken_pox_check_cough_false")
    choose("tuberculosis_chicken_pox_check_weight_loss_false")
    choose("tuberculosis_chicken_pox_check_fever_false")
    choose("tuberculosis_chicken_pox_check_had_tb_false")

    choose("tuberculosis_chicken_pox_check_had_chicken_pox_true")
    select_date(5.years.ago, from: "tuberculosis_chicken_pox_check_chicken_pox_date")
    click_button "Save"

    expect(current_path).to eq(member_area_member_profile_path)
    expect(page).to have_content "Tuberculosis and chicken pox check saved"

    click_link "Tuberculosis and Chicken Pox Information"

    expect(current_path).to eq(edit_member_area_tuberculosis_chicken_pox_check_path)

    choose("tuberculosis_chicken_pox_check_lived_continuously_false")

    click_link "Add country"

    within(all("#visited-countries .nested-fields").last) do
      fill_in "Name", with: "Some Title"
      fill_in "Duration (in months)", with: 5
    end

    choose("tuberculosis_chicken_pox_check_had_tb_true")
    fill_in "tuberculosis_chicken_pox_check_additional_information", with: "Some content"
    click_button "Save"

    expect(current_path).to eq(member_area_member_profile_path)
    expect(page).to have_content "Tuberculosis and chicken pox check updated"
  end
end

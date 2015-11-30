require "rails_helper"

RSpec.feature "creating and updating member addresses", type: :feature do
  let!(:member_profile){ create(:member_profile) }

  it "should allow creation of addresses" do
    login_to_member_area_with(member_profile.email, "password")

    click_link "Application form"
    click_link "Address History"

    expect(current_path).to eq(member_area_member_addresses_path)

    click_link "New Address"

    fill_in "Address", with: "Some address"
    select_date(3.years.ago, from: "member_address_lived_here_from")
    check("Current Address")

    click_button "Save"

    expect(current_path).to eq(member_area_member_addresses_path)
    expect(page).to have_content "Address was successfully saved"
    expect(page).to have_content "Some address"
  end

  it "should allow editing of addresses" do
    address = create(:member_address, member_profile: member_profile)
    login_to_member_area_with(member_profile.email, "password")

    click_link "Application form"
    click_link "Address History"

    expect(current_path).to eq(member_area_member_addresses_path)
    click_link("edit-member-address-#{ address.id }")

    expect(current_path).to eq(edit_member_area_member_address_path(address))
    fill_in "Address", with: "A new address"

    click_button "Save"

    expect(current_path).to eq(member_area_member_addresses_path)
    expect(page).to have_content "Address was successfully updated"
    expect(page).to have_content "A new address"

  end
end
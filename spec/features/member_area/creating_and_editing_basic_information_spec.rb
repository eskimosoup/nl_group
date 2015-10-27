require "rails_helper"

RSpec.feature "setting basic information", type: :feature do
  let!(:member_profile){ create(:member_profile) }

  it "should allow creation of basic information" do
    login_to_member_area_with("joe.bloggs@example.com", "password")
    click_link "About You"

    expect(current_path).to eq(new_member_area_basic_information_path)
    expect(page).to have_content("About You")

    click_button "Save"
  end

  it "should allow updating of basic information" do
    basic_information = create(:basic_information, member_profile: member_profile)
    login_to_member_area_with("joe.bloggs@example.com", "password")
    click_link "About You"

    expect(current_path).to eq(edit_member_area_basic_information_path)
    expect(page).to have_content("About You")

    click_button "Save"
  end
end

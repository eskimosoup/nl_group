require "rails_helper"

RSpec.feature "setting basic information", type: :feature do
  let!(:member_profile){ create(:member_profile) }

  it "should allow creation of basic information" do
    login_to_member_area_with(member_profile.email, "password")
    click_link "About You"

    expect(current_path).to eq(new_member_area_basic_information_path)
    expect(page).to have_content("About You")
    choose("Mr")
    fill_in "First name", with: "Joe"
    fill_in "Last name", with: "Bloggs"
    fill_in "Mobile number", with: "01234 567890"
    fill_in "Email address", with: "joe.bloggs@example.com"
    choose("basic_information_changed_name_false")
    select_date(Date.today - 20.years, from: "basic_information_using_current_name_since", discard_day: true)
    select_date(Date.today - 20.years, from: "basic_information_date_of_birth")
    fill_in "National insurance number", with: "BLAH"
    choose("basic_information_where_heard_website")

    click_button "Save"
    expect(page).to have_content("Basic Information successfully saved")
  end

  it "should allow updating of basic information" do
    basic_information = create(:basic_information, member_profile: member_profile)
    login_to_member_area_with(member_profile.email, "password")
    click_link "About You"

    expect(current_path).to eq(edit_member_area_basic_information_path)
    expect(page).to have_content("About You")

    choose("Mr")
    fill_in "First name", with: "Joe"
    fill_in "Last name", with: "Bloggs"
    fill_in "Mobile number", with: "01234 567890"
    fill_in "Email address", with: "joe.bloggs@example.com"
    choose("basic_information_changed_name_false")
    select_date(Date.today - 20.years, from: "basic_information_using_current_name_since", discard_day: true)
    select_date(Date.today - 20.years, from: "basic_information_date_of_birth")
    fill_in "National insurance number", with: "BLAH"
    choose("basic_information_where_heard_website")

    click_button "Save"
    expect(page).to have_content("Basic Information successfully updated")
  end
end

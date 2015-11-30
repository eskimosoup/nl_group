require "rails_helper"

RSpec.describe "Creating a Landing Page Why Work", type: :feature, js: true do
  it "should allow creating of landing pages" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Landing Page Why Work"
    expect(current_path).to eq(optimadmin.landing_page_why_works_path)

    click_link "New Landing Page Why Work"
    expect(current_path).to eq(optimadmin.new_landing_page_why_work_path)

    fill_in "landing_page_why_work_title", with: "A title"
    tiny_mce_fill_in "landing_page_why_work_content", with: "Some content"

    click_link "Settings"

    click_button "Create Landing page why work"

    expect(current_path).to eq(optimadmin.landing_page_why_works_path)
    expect(page).to have_content "Landing page why work was successfully created."
  end
end
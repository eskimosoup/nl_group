require "rails_helper"

RSpec.describe "Creating a Landing Page", type: :feature, js: true do
  it "should allow creating of landing pages" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Landing Pages"
    expect(current_path).to eq(optimadmin.landing_pages_path)

    click_link "New Landing Page"
    expect(current_path).to eq(optimadmin.new_landing_page_path)

    fill_in "Name", with: "Landing page name"

    click_button "Create Landing page"

    expect(current_path).to eq(optimadmin.landing_pages_path)
    expect(page).to have_content "Landing page was successfully created."

  end
end
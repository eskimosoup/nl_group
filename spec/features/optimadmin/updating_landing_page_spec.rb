require "rails_helper"

RSpec.feature "Updating A Page", type: :feature, js: true do
  subject!(:landing_page) { create(:landing_page) }
  it "should allow a page to be updated" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Landing Pages"

    expect(current_path).to eq(optimadmin.landing_pages_path)
    expect(page).to have_content(landing_page.name)

    within("#item_#{ landing_page.id }") do
      find(:xpath, "//a[@href='#{ current_host_and_port }#{ optimadmin.edit_landing_page_path(landing_page) }']").click
    end
    expect(page).to have_content("Edit Landing Page")
    fill_in "Name", with: "New name"
    click_button "Update Landing page"

    expect(page).to have_content('Landing page was successfully updated.')
  end
end
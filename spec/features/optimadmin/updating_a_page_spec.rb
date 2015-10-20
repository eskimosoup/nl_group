require "rails_helper"

RSpec.feature "Updating A Page", type: :feature, js: true do
  subject!(:page_model) { create(:page) }
  it "should allow a page to be updated" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Pages"
    expect(current_path).to eq(optimadmin.pages_path)
    expect(page).to have_content(page_model.title)

    within("#item_#{ page_model.id }") do
      find(:xpath, "//a[@href='#{ current_host_and_port }#{ optimadmin.edit_page_path(page_model) }']").click
    end
    expect(page).to have_content("Edit Page")
    fill_in "Title", with: "New title"
    click_button "Update Page"

    expect(page).to have_content('Page was successfully updated.')

  end
end

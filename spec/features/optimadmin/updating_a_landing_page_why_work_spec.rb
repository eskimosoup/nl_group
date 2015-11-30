require "rails_helper"

RSpec.feature "Updating A Landing Page Why Work", type: :feature, js: true do
  subject!(:landing_page_why_work) { create(:landing_page_why_work) }
  it "should allow a page to be updated" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Landing Page Why Work"

    expect(current_path).to eq(optimadmin.landing_page_why_works_path)
    expect(page).to have_content(landing_page_why_work.title)

    within("#item_#{ landing_page_why_work.id }") do
      find(:xpath, "//a[@href='#{ current_host_and_port }#{ optimadmin.edit_landing_page_why_work_path(landing_page_why_work) }']").click
    end
    expect(page).to have_content("Edit Landing Page Why Work")
    fill_in "landing_page_why_work_title", with: "New title"
    click_button "Update Landing page why work"

    expect(page).to have_content("Landing page why work was successfully updated.")
  end
end
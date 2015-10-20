require "rails_helper"

RSpec.feature "Destroying A Page", type: :feature, js: true do
  subject!(:page_model) { create(:page) }
  it "should allow a page to be destroyed" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Pages"

    expect(current_path).to eq(optimadmin.pages_path)
    expect(page).to have_content(page_model.title)

    within("#item_#{ page_model.id }") do
      find("a[data-method='delete']").click
    end
    # Click ok on confirm
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('Page was successfully destroyed.')
  end
end
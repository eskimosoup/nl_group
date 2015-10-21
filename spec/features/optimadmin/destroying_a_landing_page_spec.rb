require "rails_helper"

RSpec.feature "Destroying A Page", type: :feature, js: true do
  subject!(:landing_page) { create(:landing_page) }
  it "should allow a page to be destroyed" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Landing Pages"

    expect(current_path).to eq(optimadmin.landing_pages_path)
    expect(page).to have_content(landing_page.name)

    within("#item_#{ landing_page.id }") do
      find("a[data-method='delete']").click
    end
    # Click ok on confirm
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('Landing page was successfully destroyed.')
  end
end
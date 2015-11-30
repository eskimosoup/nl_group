require "rails_helper"

RSpec.feature "Destroying A Landing Page Why Work", type: :feature, js: true do
  subject! { create(:landing_page_why_work) }
  it "should allow a page to be destroyed" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Landing Page Why Work"

    expect(current_path).to eq(optimadmin.landing_page_why_works_path)
    expect(page).to have_content(subject.title)

    within("#item_#{ subject.id }") do
      find("a[data-method='delete']").click
    end
    # Click ok on confirm
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("Landing page why work was successfully destroyed.")
  end
end
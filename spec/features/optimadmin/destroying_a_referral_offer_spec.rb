require "rails_helper"

RSpec.feature "Destroying A Referral offer", type: :feature, js: true do
  subject!(:referral_offer) { create(:referral_offer) }
  it "should allow a page to be destroyed" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Referral Offer"
    expect(current_path).to eq(optimadmin.referral_offers_path)
    expect(page).to have_content(referral_offer.title)

    within("#item_#{ referral_offer.id }") do
      find("a[data-method='delete']").click
    end
    # Click ok on confirm
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('Referral offer was successfully destroyed.')
  end
end
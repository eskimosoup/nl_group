require "rails_helper"

RSpec.feature "Updating A Referral offer", type: :feature, js: true do
  subject!(:referral_offer) { create(:referral_offer) }
  it "should allow a referral offer to be updated" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Referral Offer"
    expect(current_path).to eq(optimadmin.referral_offers_path)
    expect(page).to have_content(referral_offer.title)

    within("#item_#{ referral_offer.id }") do
      find(:xpath, "//a[@href='#{ current_host_and_port }#{ optimadmin.edit_referral_offer_path(referral_offer) }']").click
    end
    expect(page).to have_content("Edit Referral Offer")
    fill_in "Title", with: "New title"
    click_button "Update Referral offer"

    expect(page).to have_content('Referral offer was successfully updated.')

  end
end
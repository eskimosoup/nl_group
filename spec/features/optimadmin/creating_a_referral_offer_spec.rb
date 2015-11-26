require "rails_helper"

RSpec.feature "Creating a referral offer", type: :feature, js: true do
  it "should allow referral offers to be created" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Referral Offer"
    expect(current_path).to eq(optimadmin.referral_offers_path)

    click_link "New Referral Offer"
    expect(current_path).to eq(optimadmin.new_referral_offer_path)
    fill_in "Title", with: "Title"
    tiny_mce_fill_in "referral_offer_details", with: "My offer details"
    tiny_mce_fill_in "referral_offer_terms_and_conditions", with: "My offer terms"

    click_button "Create Referral offer"

    expect(current_path).to eq(optimadmin.referral_offers_path)
    expect(page).to have_content("Referral offer was successfully created")
  end
end
require "rails_helper"

RSpec.describe "creating a referral", type: :feature do
  let!(:member_profile){ create(:member_profile) }
  let!(:referral_offer) { create(:referral_offer) }

  it "allows referrals to be made" do
    login_to_member_area_with(member_profile.email, member_profile.password)

    click_link "Referral Offers"
    expect(current_path).to eq(member_area_referral_offers_path)

    click_link("View Offer")
    expect(current_path).to eq(member_area_referral_offer_path(referral_offer))

    fill_in "referral_name", with: "My name"
    fill_in "referral_email", with: "james@optimised.today"

    click_button "Create Referral"

    expect(last_email).to_not be_nil
    expect(last_email.to).to include(site_email)
  end
end
